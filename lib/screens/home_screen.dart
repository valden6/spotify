import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {

  _dynamicMessage(){

    String res;

    if(DateTime.now().hour >= 19 && DateTime.now().hour <= 24)
      res = "Good evening";
    else if(DateTime.now().hour >= 0 && DateTime.now().hour <= 12)
      res = "Good morning";
    else if(DateTime.now().hour >= 13 && DateTime.now().hour <= 18)
      res = "Good afternoon";

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(_dynamicMessage(),style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: FaIcon(FontAwesomeIcons.cog,color: Colors.white)
                        )
                      )
                    ]
                  )
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/liked-song.png"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Liked Songs",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/top-song-2020.jpeg"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Your Top Songs 2020",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          )
                        ]
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/disco.jpeg"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Disco Forever",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/happy-hits.jpeg"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Happy Hits!",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          )
                        ]
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/jazz-night.jpeg"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Late Night Jazz",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black54
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Image.asset("assets/chill-vibes.jpeg"),
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      child: Text("Chill Vibes",style: TextStyle(color: Colors.white)),
                                    )
                                  )
                                ]
                              )
                            )
                          )
                        ]
                      )
                    ]
                  )
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Recently played",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  // width: MediaQuery.of(context).size.width,
                  height: 155,
                  child: ListView.builder(
                    itemCount: 6,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      String playlistName = (index % 3 == 0) ? "Disco" : "Liked Songs";
                      String playlistImg = (index % 3 == 0) ? "assets/disco.jpeg" : "assets/liked-song.png";
                
                      return Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              child: Image.asset(playlistImg),                      
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            Container(
                              width: 130,
                              child: Text(playlistName,style: TextStyle(color: Colors.white,fontSize: 12))
                            )
                          ]
                        )
                      );
                    }
                  )
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("15 minutes or less shows",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  // width: MediaQuery.of(context).size.width,
                  height: 205,
                  child: ListView.builder(
                    itemCount: 6,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      String playlistName = (index % 3 == 0) ? "Die less stupid" : "PsychoShot";
                      String playlistType = (index % 3 == 0) ? "Show • Prisma Media" : "Show • MindCraft";
                      String playlistImg = (index % 3 == 0) ? "assets/podcast-mourir.jpeg" : "assets/podcast-psycho.jpeg";
                
                      return Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              width: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(playlistImg),
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            Container(
                              width: 160,
                              child: Column(
                                children: [
                                  Container(
                                    width: 160,
                                    child: Text(playlistName,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold))
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                                  Container(
                                    width: 160,
                                    child: Text(playlistType,style: TextStyle(color: Colors.grey,fontSize: 12))
                                  )
                                ]
                              )
                            )
                          ]
                        )
                      );
                    }
                  )
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage("assets/artist.jpeg"),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text("MORE LIKE",style: TextStyle(color: Colors.grey,fontSize: 11)),
                              Text("Ali Gatie",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                            ]
                          )
                        ),
                      )
                    ]
                  )
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  // width: MediaQuery.of(context).size.width,
                  height: 205,
                  child: ListView.builder(
                    itemCount: 6,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      String playlistName = (index % 3 == 0) ? "Rihanna, Bruno Mars, The Weeknd" : "Harry Styles, Olivia Rodrigo, Sam Smith, Ju...";
                      String playlistImg = (index % 3 == 0) ? "assets/internet-rewind.jpeg" : "assets/sad-songs.jpeg";
                
                      return Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              width: 160,
                              child: Image.asset(playlistImg),                      
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              width: 160,
                              child: Text(playlistName,style: TextStyle(color: Colors.white,fontSize: 12))
                            )
                          ]
                        )
                      );
                    }
                  )
                )
              ]
            )
          )
        ),
      )
    );
  }
}