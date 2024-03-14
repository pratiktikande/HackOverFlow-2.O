import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:lawtrix/screens/home_screen/advocate_home_screen.dart';
import 'package:lawtrix/screens/home_screen/moreinfo.dart';
import 'package:lawtrix/screens/settings_screen.dart';
import 'package:lawtrix/screens/trial%20pages/news_screen.dart';
import 'package:lawtrix/screens/trial%20pages/cases_screen.dart';
import 'package:lawtrix/screens/trial%20pages/schedulepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool view = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      view = !view;
                    });
                  },
                  icon: view
                      ? const Icon(Icons.dashboard)
                      : const Icon(Icons.list),
                ),
              ],
            ),
          ),
          Expanded(
            child: view
                ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: AdvocateHomePage.types.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MoreDetails(type: AdvocateHomePage.types[index]),
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${AdvocateHomePage.types[index]} cases',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            )
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                ),
                itemCount: AdvocateHomePage.types.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoreDetails(
                            type: AdvocateHomePage.types[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Center(
                        child: Text(
                          '${AdvocateHomePage.types[index]} cases',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
