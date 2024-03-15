import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lawtrix/client/trials/retd.dart';


class Clsify extends StatefulWidget {
  @override
  _ClsifyState createState() => _ClsifyState();
}

class _ClsifyState extends State<Clsify> {
  TextEditingController _textFieldController = TextEditingController();
  String _result = '';

  Future<void> _sendRequest() async {
    String text = _textFieldController.text;
    if (text.isNotEmpty) {
      var apiUrl = Uri.parse('https://api-inference.huggingface.co/models/CamodDew/btrial');
      var headers = {'Content-Type': 'application/json'};
      var data = jsonEncode({'inputs': text});

      var response = await http.post(apiUrl, headers: headers, body: data);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List<dynamic> labels = jsonResponse[0];
        var topLabel = labels[0];
        setState(() {
          _result = topLabel['label'];
          Navigator.of(context).push(
            MaterialPageRoute(
              // builder: (context) => sprov_viewRequestinfo('655aef8f3c0f33d37e9ee92a'),
              // builder: (context) =>  viewRequestInfor( Rid: '655aef8f3c0f33d37e9ee92a'),
              // builder: (context) =>  CaseListWidget('655aedef3c0f33d37e9ee923'),
              // builder: (context) => CJScreen(),
              builder:(context)=> LawyerScreen( label: _result),
            ),
          );
        });
      } else {
        setState(() {
          _result = 'Error occurred: ${response.reasonPhrase}';
        });
      }
    } else {
      setState(() {
        _result = 'Please enter some text';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: 'Enter some text',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _sendRequest,
              child: Text('Send'),
            ),
            SizedBox(height: 20),
            Text(
              'Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
