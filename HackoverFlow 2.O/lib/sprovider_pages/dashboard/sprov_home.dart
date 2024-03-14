import 'package:flutter/material.dart';
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:lawtrix/sprovider_pages/dashboard/sprov_theme.dart';
import 'package:lawtrix/sprovider_pages/dashboard/tabIcon_data.dart';
import '../../screens/home_screen.dart';
import 'feed/posthome.dart';
import 'Network_Invitations/netcomplete.dart';
import 'BottomNav/bottom_bar_view.dart';
import 'jobNotifications/NotificationHome.dart';

class DashboardHandler extends StatefulWidget {
  const DashboardHandler({Key? key}) : super(key: key);

  @override
  DashboardHandlerState createState() => DashboardHandlerState();
}

class DashboardHandlerState extends State<DashboardHandler>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: DashBoardTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = PostList();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        // title: Text('Create Your Profile'),
      ),

        drawer: const NavDrawer(),
        // backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),

    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(

      children: <Widget>[

        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      PostList();
                });
              });
            } else if (index == 1 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      CombinedNetworkScreen();
                });
              });
            }else if (index == 2 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      const NotificationHome();
                });
              });
            }else if (index == 3 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      const HomePage();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('First Screen'),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Second Screen'),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Create Your Profile'),

    ),
    drawer:  const NavDrawer(),
    body: const Center(
      child: Text('Third Screen'),

    ));
  }
}
