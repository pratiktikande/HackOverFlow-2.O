import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:lawtrix/screens/trial%20pages/existing_cases.dart';
import 'package:lawtrix/screens/trial%20pages/solved_cases.dart';

import '../../services/calendar.dart';
class CasesPage extends StatelessWidget {
  const CasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cases'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Existing Cases'),
              Tab(text: 'Solved Cases'),
              Tab(text: 'Schedule')
            ],
          ),
        ),
        drawer: NavDrawer(),
        body: TabBarView(
          children: [
            ExistingCasesPage(),
            SolvedCasesPage(),
            Calendar(),
          ],
        ),
      ),
    );
  }
}
