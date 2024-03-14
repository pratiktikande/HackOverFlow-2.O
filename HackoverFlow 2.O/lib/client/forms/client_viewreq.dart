

import 'package:flutter/material.dart';


import '../../services/apiServices/apiHelper.dart';

class ClientViewRequests extends StatefulWidget {
  final String selectedId;

  ClientViewRequests(this.selectedId);

  @override
  _ClientViewRequestsState createState() => _ClientViewRequestsState();
}

class _ClientViewRequestsState extends State<ClientViewRequests> {
  Map<String, dynamic> requestData = {};
  bool isEditing = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController userInformationController = TextEditingController();
  TextEditingController privacyConsentController = TextEditingController();
  TextEditingController attachedDocumentsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
    // await http.get(Uri.parse("http://localhost:3000/case/${widget.selectedId}"));
    await ApiHelper.callApiAndParse("https://lawtrix-backend-server.onrender.com/case/${widget.selectedId}");
    // if (response.statusCode == 200) {
      setState(() {
        requestData = response;

        // Set initial values for controllers
        titleController.text = requestData['title'];
        caseTypeController.text = requestData['case_type'];
        budgetController.text = requestData['budget_and_pricing'].toString();
        userInformationController.text = requestData['user_information'];
        privacyConsentController.text = requestData['privacy_consent_given'].toString();
        attachedDocumentsController.text =
            requestData['document_upload']['attached_documents'].toString();
      });
    // } else {
    //   // Handle error
    //   print("Error: ${response.statusCode}");
    // }
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveDetails() {
    // Implement your save logic here
    toggleEditing();
    print("Saving details...");

    // You can access the edited values using the controllers
    print("Title: ${titleController.text}");
    print("Your Details: ${userInformationController.text}");
    print("Case Type: ${caseTypeController.text}");
    print("Your Budget: ${budgetController.text}");
    print("Privacy Consent Given: ${privacyConsentController.text}");
    print("Attached Documents: ${attachedDocumentsController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client View Requests'),
        actions: [
          isEditing
              ? IconButton(
            icon: Icon(Icons.save),
            onPressed: saveDetails,
          )
              : IconButton(
            icon: Icon(Icons.edit),
            onPressed: toggleEditing,
          ),
        ],
      ),
      body: requestData.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (String key in requestData.keys)
              if (key != '__v' && key != '_id' && key != 'document_upload')
                Card(
                  child: ListTile(
                    title: isEditing
                        ? TextField(
                      controller: _getControllerByKey(key),
                      decoration: InputDecoration(labelText: _getTitleByKey(key)),
                    )
                        : Text(
                      _getTitleByKey(key),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: isEditing
                        ? Container() // No subtitle in editing mode
                        : key == 'privacy_consent_given'
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(requestData[key]
                            ? 'Privacy Consent Given'
                            : 'Privacy Consent Not Given'),
                        SizedBox(height: 5),
                        Text(
                          "* If false, the case would be public",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    )
                        : Text(requestData[key].toString()),
                  ),
                ),
            if (requestData.containsKey('document_upload'))
              Card(
                child: ListTile(
                  title: isEditing
                      ? Row(
                    children: [
                      Text('Attached Documents'),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: attachedDocumentsController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Select documents',
                            suffixIcon: Icon(Icons.edit),
                          ),
                          onTap: () {
                            // Implement document selection logic here
                            print("Select documents");
                          },
                        ),
                      ),
                    ],
                  )
                      : Text(
                    'Attached Documents',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: isEditing
                      ? Container() // No subtitle in editing mode
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var document
                      in requestData['document_upload']['attached_documents'])
                        Row(
                          children: [
                            Text(document),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                // Implement delete document logic here
                                print("Delete document: $document");
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  TextEditingController _getControllerByKey(String key) {
    switch (key) {
      case 'title':
        return titleController;
      case 'case_type':
        return caseTypeController;
      case 'budget_and_pricing':
        return budgetController;
      case 'user_information':
        return userInformationController;
      case 'privacy_consent_given':
        return privacyConsentController;
      default:
        return TextEditingController(); // Return an empty controller for unknown keys
    }
  }

  String _getTitleByKey(String key) {
    switch (key) {
      case 'title':
        return 'Title';
      case 'case_type':
        return 'Case Type';
      case 'budget_and_pricing':
        return 'Your Budget';
      case 'user_information':
        return 'Your Details';
      case 'privacy_consent_given':
        return 'Privacy Consent Agreement';
      default:
        return key; // Return the key as title if not in the mapping
    }
  }
}

