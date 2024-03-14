import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';

class ProfileCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Profile'),

      ),
      // drawer: NavDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // General Information Section
            buildSectionTitle('General Information'),
            buildTextField('Name'),
            buildTextField('Location'),
            buildTextField('Email'),
            buildTextField('Phone'),

            // Skills Section
            buildSectionTitle('Skills'),
            buildTextField('Skill 1'),
            buildTextField('Skill 2'),
            buildTextField('Skill 3'),

            // Notable Cases Section
            buildSectionTitle('Notable Cases'),
            buildTextField('Notable Case 1'),
            buildTextField('Notable Case 2'),
            buildTextField('Notable Case 3'),

            // Education Section
            buildSectionTitle('Education'),
            buildTextField('Education 1'),
            buildTextField('Education 2'),

            // Awards and Recognitions Section
            buildSectionTitle('Awards and Recognitions'),
            buildTextField('Award 1'),
            buildTextField('Award 2'),

            // Contact Information Section
            buildSectionTitle('Contact Information'),
            buildTextField('Website'),
            buildTextField('LinkedIn'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the user's profile information here
          // You can send this data to a server or store it locally
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
