
import 'package:flutter/material.dart';
import 'package:lawtrix/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_screen.dart';

class webb extends StatefulWidget {
  const webb({Key? key}) : super(key: key);

  @override
  State<webb> createState() => _webbState();
}

class _webbState extends State<webb> {
  @override
  Widget build(BuildContext context) {
    _launchURL('https://huggingface.co/spaces/CamodDew/youtubelegal');
    return HomePage();
  }
}

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
