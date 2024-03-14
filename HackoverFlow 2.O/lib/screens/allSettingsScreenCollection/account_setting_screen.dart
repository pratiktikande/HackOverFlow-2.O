import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  bool editable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  label: const Text("Change Name"), enabled: editable),
            ),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text("Change email"), enabled: editable),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            editable = !editable;
          });
        },
        child: editable ? Icon(Icons.save) : Icon(Icons.edit),
      ),
    );
  }
}
