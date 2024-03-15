import 'dart:convert';

import 'package:flutter/material.dart';


class LawyerScreen extends StatefulWidget {
  final String label;

  LawyerScreen({required this.label});

  @override
  _LawyerScreenState createState() => _LawyerScreenState();
}

class _LawyerScreenState extends State<LawyerScreen> {
  List<Map<String, dynamic>> _lawyers = [];

  @override
  void initState() {
    super.initState();
    fetchData(widget.label);
  }

  void fetchData(String label) {
    // Here you would fetch the data from your JSON file or API
    String jsonString = '{"LABEL_0":[{"name":"John Smith","specialization":"Corporate Law","location":"New York","experience":"10 years"},{"name":"Alice Johnson","specialization":"Intellectual Property Law","location":"San Francisco","experience":"8 years"},{"name":"Michael Brown","specialization":"Tax Law","location":"Chicago","experience":"12 years"}],"LABEL_1":[{"name":"Emily Parker","specialization":"Family Law","location":"Los Angeles","experience":"7 years"},{"name":"David Lee","specialization":"Immigration Law","location":"Houston","experience":"9 years"},{"name":"Jennifer White","specialization":"Criminal Law","location":"Miami","experience":"11 years"}],"LABEL_2":[{"name":"Robert Johnson","specialization":"Environmental Law","location":"Seattle","experience":"6 years"},{"name":"Sophia Anderson","specialization":"Healthcare Law","location":"Boston","experience":"5 years"},{"name":"Daniel Martinez","specialization":"Real Estate Law","location":"Dallas","experience":"8 years"}]}';
    Map<String, dynamic> data = json.decode(jsonString);

    // Check if the label exists in the data
    if (data.containsKey(label)) {
      setState(() {
        _lawyers = List<Map<String, dynamic>>.from(data[label]);
      });
    } else {
      setState(() {
        _lawyers = [];
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Label Not Found'),
            content: Text('The entered label does not exist.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawyers App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Label: ${widget.label}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _lawyers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_lawyers[index]['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Specialization: ${_lawyers[index]['specialization']}'),
                          Text('Location: ${_lawyers[index]['location']}'),
                          Text('Experience: ${_lawyers[index]['experience']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
