import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SamarthTrialPage extends StatefulWidget {
  const SamarthTrialPage({super.key});

  @override
  State<SamarthTrialPage> createState() => _SamarthTrialPageState();
}

class _SamarthTrialPageState extends State<SamarthTrialPage> {
  // Ithe Samarth je karaycha ahe te kar
  List _items = [];
  int _expandedIndex = -1;

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["new_case"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Display the data loaded from sample.json
          _items.isNotEmpty
              ? Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16).copyWith(bottom: 0),
                        child: Text(
                          _items[index]["title"],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16).copyWith(bottom: 0),
                        child: Text(
                          _items[index]["desc"],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: Text('Handle Case'),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text('View Details'),
                            onPressed: () {
                              setState(() {
                                _expandedIndex = _expandedIndex == index ? -1 : index;
                              });
                            },
                          )
                        ],
                      ),
                      if (_expandedIndex == index)
                        Container(
                          height: 100,
                          child: Center(
                            child: Text(_items[index]["detail"]??"No Description available for this case"),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )
              : Container()
        ],
      ),
    );
  }
}
