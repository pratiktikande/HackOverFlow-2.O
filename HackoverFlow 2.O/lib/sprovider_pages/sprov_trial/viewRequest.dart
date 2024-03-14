

import 'package:flutter/material.dart';

import '../../services/apiServices/apiHelper.dart';

class sprov_viewRequestinfo extends StatefulWidget {
  final String caseid;
  sprov_viewRequestinfo(this.caseid);
  @override
  State<sprov_viewRequestinfo> createState() => _sprov_viewRequestinfoState();
}

class _sprov_viewRequestinfoState extends State<sprov_viewRequestinfo> {
  Map<String, dynamic> requestData = {};
  Map<String, dynamic> userData = {};

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
    await ApiHelper.callApiAndParse("https://lawtrix-backend-server.onrender.com/case/${widget.caseid}");
    setState(() {
      print("xxce"+"\n"+response.runtimeType.toString()+"\n"+response.toString());
      requestData = response;
      // Call fetchUserData after fetching requestData
      fetchUserData();
    });
  }

  Future<void> fetchUserData() async {
    var userResponse;
    try {
      userResponse = await ApiHelper.callApiAndParse(
          "https://lawtrix-backend-server.onrender.com/user/"+requestData['user_information']);
    } catch (e) {
      userResponse = {};
    }
    setState(() {
      print("xxce"+"\n"+userResponse.runtimeType.toString()+"\n"+userResponse.toString());
      userData = userResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON Display Example'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Request Data:'),
              JsonDisplay(data: requestData),
              SizedBox(height: 20),
              Text('User Data:'),
              JsonDisplay(data: userData),
            ],
          ),
        ),
      ),
    );
  }
}
class JsonDisplay extends StatelessWidget {
  final Map<String, dynamic> data;

  JsonDisplay({required this.data});

  @override
  Widget build(BuildContext context) {
    try {
      if (data.isEmpty) {
        return Text('No information was provided.');
      }

      return Expanded(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            String key = data.keys.elementAt(index);
            dynamic value = data[key];

            return ListTile(
              title: Text('$key: $value'),
            );
          },
        ),
      );
    } catch (e) {
      return Text('Invalid JSON format: $e');
    }
  }
}

