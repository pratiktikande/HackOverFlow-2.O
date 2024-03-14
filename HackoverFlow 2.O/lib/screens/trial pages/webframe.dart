import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Import the kIsWeb constant
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/clientNavigation.dart';

class Weba extends StatefulWidget {
  const Weba({Key? key}) : super(key: key);

  @override
  State<Weba> createState() => _WebaState();
}

class _WebaState extends State<Weba> {
  late final WebViewController _controller;
  late Future<String> _usrType;

  @override
  void initState() {
    super.initState();
    _usrType = _getUserType();

    try{
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/') && kIsWeb) {
            // Only prevent navigation on the web
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse('https://huggingface.co/spaces/CamodDew/youtubelegal'));
    _controller = controller;
    }catch(e){
      _launchUrl();
    }
  }
  Future<String> _getUserType() async {
    final sharedpref = await SharedPreferences.getInstance();
    return sharedpref.getString('usr_typ') ?? 'default'; // 'default' can be a fallback value
  }
  void _launchUrl() {
    print('Launching URL on the web');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LawTrixBot')),
      body: WebViewWidget(controller: _controller),
      drawer: FutureBuilder<String>(
        future: _usrType,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final usrType = snapshot.data;

            if (usrType == 'client') {
              return clientNav();
            } else {
              return NavDrawer();
            }
          } else {
            return CircularProgressIndicator(); // Show loading indicator while fetching user type
          }
        },
      ),
    );
  }
}
