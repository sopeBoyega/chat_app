import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
      ),
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}