import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SolvedCasesPage extends StatefulWidget {
  const SolvedCasesPage({super.key});

  @override
  State<SolvedCasesPage> createState() => _SolvedCasesPageState();
}

class _SolvedCasesPageState extends State<SolvedCasesPage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["all_cases"];
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
                return Visibility(
                  visible: _items[index]["solved"],
                  child: Card(
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
                          padding: EdgeInsets.only(left: 16,top: 5),
                          child: Text(
                            _items[index]["date"],
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            _items[index]["desc"],
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: Text('Mark as done'),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
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
