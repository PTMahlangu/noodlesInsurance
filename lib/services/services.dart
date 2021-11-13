import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:masi/commons/constant.dart';

class Services {
  
  void textractService() async {
    final url =
        "https://hphkxtsi7e.execute-api.us-east-2.amazonaws.com/default/GEWhHackathon";

    final hearders = {
      "Content-Type": "application/json",
      "x-api-key": "awsToken"
    };

    Map data = {"Image": testImage};

    var response = await http.post(Uri.parse(url), headers: hearders, body: json.encode(data));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    }
  }
}
