import 'package:flutter/material.dart';

import 'ConnectionsScreen.dart';
import 'networkcard.dart';

class CombinedNetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Connections & Network'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Invitations'),
              Tab(text: 'Network'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ConnectionScreen(),
            NetworkScreen(),
          ],
        ),
      ),
    );
  }
}