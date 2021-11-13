import 'package:flutter/material.dart';
import 'package:masi/commons/colors.dart';
import 'package:masi/services/services.dart';
import 'package:masi/view/camera.dart';

class HomePage extends StatefulWidget {
  final camera;
  HomePage({Key? key, @required this.camera}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  bool isNumberFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Center(
            child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Funeral Policy Name",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Get Funeral cover in 60 seconds!",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white)),
                  ],
                )),
          ),
          elevation: 8,
          color: mainColor,
          shadowColor: Colors.black38,
          margin: EdgeInsets.all(0),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey, width: 1)),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          key: _formkey,
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 20),
            child: TextFormField(
              controller: mobileNumber,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: "",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 0.0),
                ),
                border: OutlineInputBorder(),
                labelText: "Mobile Number",
                labelStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.amberAccent, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Mobile Number field can't be empty.";
                }
                if (value.length != 10) {
                  return "Invalid Number";
                }
                // if (!RegExp(
                //      r"^[+][2][7]?[0-9]{9}$")
                //     .hasMatch(value)) {
                //   return "Please enter valid number";
                // }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: mainColor),
            primary: Colors.white,
            backgroundColor: mainColor,
            minimumSize: Size(320, 50),
          ),
          child: Text('Countinue'),
          onPressed: () {
            if (!_formkey.currentState!.validate()) {
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TakeASelfie(
                        camera: widget.camera,
                      )),
            );
          },
        ),
        SizedBox(
          height: 80,
        ),
        Text("Click To Claim",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ))
      ],
    )));
  }
}

class TakeASelfie extends StatefulWidget {
  final camera;
  TakeASelfie({Key? key, this.camera}) : super(key: key);

  @override
  _TakeASelfieState createState() => _TakeASelfieState();
}

class _TakeASelfieState extends State<TakeASelfie> {
  Services services = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Please take a picture of your ID"),
            ),
            SizedBox(
              height: 60,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1.0, color: mainColor),
                primary: Colors.white,
                backgroundColor: mainColor,
                minimumSize: Size(120, 40),
              ),
              child: Text('Countinue'),
              onPressed: () {
                services.textractService();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => TakePictureScreen(
                //             camera: widget.camera,
                //           )),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
