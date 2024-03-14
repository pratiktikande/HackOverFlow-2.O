import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CJScreen extends StatefulWidget {
  @override
  _CJScreenState createState() => _CJScreenState();
}

class _CJScreenState extends State<CJScreen> {
  TextEditingController _inputController = TextEditingController();
  List<ChatMessage> _chatHistory = [];

  @override
  void initState() {
    super.initState();
    // Initial message
    _chatHistory.add(ChatMessage(
      sender: "Lawtrix",
      text: "I am Lawtrix",
    ));
  }

  Future<void> _sendRequest() async {
    final url = Uri.parse("https://api-inference.huggingface.co/models/CamodDew/flanTrial1");
    final headers = {'Content-Type': 'application/json'};
    final body = {'inputs': _inputController.text.toLowerCase()};
    final response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _chatHistory.add(ChatMessage(
          sender: "You",
          text: _inputController.text,
        ));
        _chatHistory.add(ChatMessage(
          sender: "Lawtrix",
          text: jsonResponse[0]['generated_text'],
        ));
        _inputController.clear();
      });
    } else {
      setState(() {
        _chatHistory.add(ChatMessage(
          sender: "Error",
          text: 'Error: ${response.statusCode}',
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lawtrix Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) => _chatHistory[index],
              ),
            ),
            TextField(
              controller: _inputController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendRequest,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String text;

  ChatMessage({required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender == "You" ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: sender == "You" ? Colors.lightGreen : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '$sender: $text',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
