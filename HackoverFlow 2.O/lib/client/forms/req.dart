import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class reqpage extends StatefulWidget {
  const reqpage({Key? key});

  @override
  State<reqpage> createState() => _reqpageState();
}

class _reqpageState extends State<reqpage> {
  List _items = [];
  int _expandedIndex = -1;
  List<String> rl = ['anand', 'jayesh', 'raju']; // Your list of names

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/templates.json');
    final data = json.decode(response);

    setState(() {
      _items = data["requests"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
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
                  elevation: 100,
                  color: Colors.deepPurpleAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16).copyWith(bottom: 0),
                        child: Text(
                          _items[index]["title"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(16).copyWith(bottom: 0),
                      //   child: Text(
                      //     _items[index]["description"],
                      //     style: TextStyle(fontSize: 14, color: Colors.white),
                      //   ),
                      // ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: Text('Handle Case', style: TextStyle(color: Colors.white)),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text('View Details', style: TextStyle(color: Colors.white)),
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
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'desc: ${_items[index]["description"] ?? "N/A"}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'some:  ${rl.join(', ')}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'some2: ${_items[index]["some2"] ?? "N/A"}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
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
