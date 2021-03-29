import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify/animations/slide_top_transition.dart';
import 'package:spotify/screens/music_screen.dart';

class MusicController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: GestureDetector(
        onTap: () => Navigator.push(context, SlideTopRoute(page: MusicScreen())),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.grey[850],
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset("assets/reco-album-1.jpeg"),
                )
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Shooting Star",style: TextStyle(color: Colors.white,fontSize: 12))
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Kazzey, Sally Green • Night City",style: TextStyle(color: Colors.grey,fontSize: 12))
                      )
                    ]
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(child: FaIcon(FontAwesomeIcons.slidersH,color: Colors.grey,size: 20))
                )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(child: FaIcon(FontAwesomeIcons.play,color: Colors.white,size: 20))
                )
              )
            ]
          )
        ),
      )
    );
  }
}