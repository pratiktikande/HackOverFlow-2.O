import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void whereToGo() async{
      var sharedpref = await SharedPreferences.getInstance();
      var isLoggedin = sharedpref.getString("token");
      var usrtype  = sharedpref.get('usr_typ');
      Timer(const Duration(seconds: 2),(){
        if(isLoggedin!=null){
          if(isLoggedin != null ){
            if(usrtype=='lsprovider'){
              Navigator.pushReplacementNamed(context, route.homePage );
            }else if(usrtype=='client'){
              Navigator.pushReplacementNamed(context, route.chome);
            }else{
              Navigator.pushReplacementNamed(context, route.fs );
            }
          }else{
            Navigator.pushReplacementNamed(context, route.fs );
          }
        }else{
          Navigator.pushReplacementNamed(context, route.fs );
        }
      },);
    }
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
              height: 200,
              width: 200,
              image: AssetImage("assets/images/logo.png"))
      ),
    );
  }
}
// Center(
// child: Image(
// height: 200,
// width: 200,
// image: AssetImage("assets/images/logo.png"))
// ),