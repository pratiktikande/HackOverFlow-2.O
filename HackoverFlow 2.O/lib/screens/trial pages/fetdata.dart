
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class FetData extends StatefulWidget {
  const FetData({Key? key}) : super(key: key);

  @override
  State<FetData> createState() => _FetDataState();
}

class _FetDataState extends State<FetData> {
  // late Future<User> _futureData;

  @override
  void initState() {
    super.initState();
    // _futureData = getData();
    getdata1();
    // print(_futureData);
    // loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> getdata1() async {

    // Replace 'your_api_url' with the actual URL of the API you want to retrieve data from
    var url = Uri.parse('https://lawtrix-backend-server.onrender.com/user');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // var yourData = response.body;
        // print(yourData);
        // print(yourData.runtimeType);
        // var yourd = response.body;
        // print(yourd);
        // var ds = response.body;

        List<dynamic>  jsonData = jsonDecode(response.body);

        // final Map<String, dynamic> jsonData = json.decode(response.body); //made for finale
        // print(jsonData['contact_information']['email']);
        // // Create a Person object from the parsed JSON
        print(jsonData);
        // return yourData;
      } else {
        // Handle the error as needed
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Handle the error as needed
      throw Exception('Failed to load data');
    }
  }
  String rem(String input) {
    return input.length >= 2 ? input.substring(1, input.length - 1) : input;
  }
}


  // Future<User> getData() async {
  //   // Replace 'your_api_url' with the actual URL of the API you want to retrieve data from
  //   var url = Uri.parse('http://localhost:3000/user');
  //
  //   try {
  //     var response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       // Parse the JSON response into your data model
  //       var jsonData = json.decode(response.body);
  //       var yourData = User.fromJson(jsonData);
  //
  //       return yourData;
  //     } else {
  //       // Handle the error as needed
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (error) {
  //     // Handle the error as needed
  //     throw Exception('Failed to load data');
  //   }
  // }
