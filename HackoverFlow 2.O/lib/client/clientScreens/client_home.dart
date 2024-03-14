import 'package:flutter/material.dart';
import 'package:lawtrix/screens/trial%20pages/fetdata.dart';
import 'package:lawtrix/sprovider_pages/dashboard/feed/addPost.dart';
import '../../components/clientNavigation.dart';
import '../../screens/trial pages/chatr.dart';
import '../../sprovider_pages/profiles/sprov_profile.dart';
import '../../sprovider_pages/sprov_trial/legalresources.dart';
import '../../sprovider_pages/sprov_trial/viewRequest.dart';
import '../forms/CreatedRequests.dart';
import '../forms/client_viewreq.dart';
import '../forms/requesthome.dart';
import '../trials/chattrial.dart';
import '../../DiscardedUseful/oldcreatedrequests.dart';

class clientHome extends StatelessWidget {
  const clientHome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const clientNav(),
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  // builder: (context) => sprov_viewRequestinfo('655aef8f3c0f33d37e9ee92a'),
                  // builder: (context) =>  viewRequestInfor( Rid: '655aef8f3c0f33d37e9ee92a'),
                  // builder: (context) =>  CaseListWidget('655aedef3c0f33d37e9ee923'),
                  // builder: (context) => CJScreen(),
                  builder:(context)=> PDFListScreen(),
                ),
              );
            },
              child: const Text("Home")),

        )
    );
  }
}

