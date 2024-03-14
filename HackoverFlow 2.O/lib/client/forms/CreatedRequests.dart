
import 'package:flutter/material.dart';


import '../../services/apiServices/apiHelper.dart';
import '../forms/client_viewreq.dart';
import '../forms/reqform.dart';

class CaseListWidget extends StatefulWidget {
  final String userId;

  CaseListWidget(this.userId);

  @override
  _CaseListWidgetState createState() => _CaseListWidgetState();
}

class _CaseListWidgetState extends State<CaseListWidget> {
  List<Map<String, dynamic>> cases = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
      // await http.get(Uri.parse("http://localhost:3000/case/user-cases/${widget.userId}"));
      await ApiHelper.callApiAndParseList("https://lawtrix-backend-server.onrender.com/case/user-cases/${widget.userId}");

      // if (response.statusCode == 200) {
        setState(() {
          // cases = List<Map<String, dynamic>>.from(json.decode(response.body));
          cases = response;
          errorMessage = ''; // Clear any previous error message
        });
      // } else {
      //   setState(() {
      //     cases = [];
      //     errorMessage = 'Error: ${response.statusCode}';
      //   });
      // }
    } catch (error) {
      setState(() {
        cases = [];
        errorMessage = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cases.isEmpty
          ? Center(
        child: Text(
          errorMessage.isEmpty ? "Try creating some requests" : errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
          : ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          final caseData = cases[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to ClientViewRequests with the case ID
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientViewRequests(caseData['_id']),
                  ),
                );
              },
              child: ListTile(
                title: Text(
                  caseData['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Description: On future update'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic for the + button action
          // For example, navigate to a screen to create a new case
          Navigator.push(context, MaterialPageRoute(builder: (context) => RequestForm()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
