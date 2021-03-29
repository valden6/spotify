import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify/app.dart';

void main() {
  runApp(SpotifyApp());
}

class SpotifyApp extends StatefulWidget {
  @override
  _SpotifyAppState createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App()
    );
  }
}