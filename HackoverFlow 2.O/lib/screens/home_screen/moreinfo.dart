import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key, required this.type});
  final String type;

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  List _items = [];

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
    super.initState();
    readJson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Cases'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: _items[index]["type"] == widget.type,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _items[index]["title"],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Text(
                              _items[index]["detail"],
                              style: TextStyle(fontSize: 14),
                            ),
                            ButtonBar(
                              children: [
                                TextButton(onPressed: (){}, child: Text("Accept Case"))
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
