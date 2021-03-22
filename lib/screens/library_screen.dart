import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {

  FaIcon _expendIcon;

  @override
  void initState() {
    super.initState();
    _expendIcon = FaIcon(FontAwesomeIcons.caretDown,size: 15,color: Colors.white);
  }

  _showRecommendedSentence(){
    Widget res;

    if(_expendIcon.icon == FontAwesomeIcons.caretDown)
      res = Container();
    else
      res = Container(
        alignment: Alignment.centerLeft,
        child: Text("Based on the songs you like.",style: TextStyle(color: Colors.grey,fontSize: 12)),
      );

    return res;
  }

  _showRecommendedAlbums(){

    Widget res;

    if(_expendIcon.icon == FontAwesomeIcons.caretDown)
      res = Container();
    else
      res = Expanded(
        child: Container(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: 20,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {

              String albumName = (index % 3 == 0) ? "Night City" : "Changes";
              String albumArtist = (index % 3 == 0) ? "Kazzey" : "Justin Bieber";
              String albumImg = (index % 3 == 0) ? "assets/reco-album-1.jpeg" : "assets/reco-album-2.jpeg";
    
              return Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(albumImg),                      
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(albumName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(albumArtist,style: TextStyle(color: Colors.grey,fontSize: 11))
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              );
            }
          )
        )
      );
      
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: MediaQuery.of(context).size.width/3 * 2,
                                child: TabBar(
                                  isScrollable: true,
                                  labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                  indicatorColor: Colors.transparent,
                                  labelColor: Colors.white,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  unselectedLabelColor: Colors.grey[600],
                                  indicatorWeight: 1,
                                  tabs: [
                                    Tab(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Music")
                                        )
                                      )
                                    ),
                                    Tab(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Podcasts"))
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ];
            },
            body: TabBarView(
              children: [
                Container(
                  child: DefaultTabController(
                    length: 3,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width/3 * 2,
                              child: TabBar(
                                isScrollable: true,
                                labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                indicatorColor: Colors.green,
                                labelColor: Colors.white,
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colors.grey[600],
                                indicatorWeight: 2,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      child: Text("Playlists")
                                    )
                                  ),
                                  Tab(
                                    child: Container(
                                      child: Text("Artists")
                                    )
                                  ),
                                  Tab(
                                    child: Container(
                                      child: Text("Albums")
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10,right: 15),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 20,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {

                                      String playlistName = (index % 3 == 0) ? "Liked Songs" : "Medieval Style";
                                      String playlistDesc = (index % 3 == 0) ? "905 songs" : "by Omar Deaazi";
                                      String playlistImg = (index % 3 == 0) ? "assets/liked-song.png" : "assets/medieval.jpeg";
                                
                                      if(index == 0){
                                        return Column(
                                          children: [
                                            Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: 15, right: 10),
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 30,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color: Colors.grey[800]
                                                        ),
                                                        child: TextField(
                                                          textAlignVertical: TextAlignVertical.center,
                                                          cursorColor: Colors.green,
                                                          decoration: InputDecoration(
                                                            prefixIconConstraints: BoxConstraints(minWidth: 30),
                                                            border: InputBorder.none,
                                                            prefixIcon: Padding(
                                                              padding: const EdgeInsets.only(left:10, right: 10),
                                                              child: FaIcon(FontAwesomeIcons.search, color: Colors.grey, size: 13),
                                                            ),
                                                            hintText: "Find in playlists",
                                                            hintStyle: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),
                                                          )
                                                        )
                                                      )
                                                    )
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right: 15),
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 8),
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[800],
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(child: Text("Filters",style:TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)))
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, right: 45, bottom: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      height: 60,
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[800]
                                                      ),
                                                      child: Center(child: FaIcon(FontAwesomeIcons.plus,color: Colors.white,size: 18)),                      
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      child: Text("Create playlist",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                  )
                                                ]
                                              )
                                            ),
                                          ],
                                        );
                                      }
                                      
                                      return Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Image.asset(playlistImg),                      
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text(playlistName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text(playlistDesc,style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      );
                                    }
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,right: 15),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 20,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {

                                      String artistName = (index % 3 == 0) ? "Ali Gatie" : "DJ Snake";
                                      String artistImg = (index % 3 == 0) ? "assets/artist.jpeg" : "assets/artist-2.jpeg";
                                
                                      if(index == 0){
                                        return Column(
                                          children: [
                                            Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: 15, right: 10),
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 30,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color: Colors.grey[800]
                                                        ),
                                                        child: TextField(
                                                          textAlignVertical: TextAlignVertical.center,
                                                          cursorColor: Colors.green,
                                                          decoration: InputDecoration(
                                                            prefixIconConstraints: BoxConstraints(minWidth: 30),
                                                            border: InputBorder.none,
                                                            prefixIcon: Padding(
                                                              padding: const EdgeInsets.only(left:10, right: 10),
                                                              child: FaIcon(FontAwesomeIcons.search, color: Colors.grey, size: 13),
                                                            ),
                                                            hintText: "Find in artists",
                                                            hintStyle: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),
                                                          )
                                                        )
                                                      )
                                                    )
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right: 15),
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(vertical: 8),
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[800],
                                                          borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Center(child: Text("Filters",style:TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)))
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(vertical: 6))
                                          ]
                                        );
                                      }
                                      
                                      return Container(
                                        padding: EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: AssetImage(artistImg),                      
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                child: Text(artistName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                              )
                                            )
                                          ]
                                        )
                                      );
                                    }
                                  )
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,right: 15),
                                  child: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                      Container(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 15, right: 10),
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 30,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Colors.grey[800]
                                                    ),
                                                    child: TextField(
                                                      textAlignVertical: TextAlignVertical.center,
                                                      cursorColor: Colors.green,
                                                      decoration: InputDecoration(
                                                        prefixIconConstraints: BoxConstraints(minWidth: 30),
                                                        border: InputBorder.none,
                                                        prefixIcon: Padding(
                                                          padding: const EdgeInsets.only(left:10, right: 10),
                                                          child: FaIcon(FontAwesomeIcons.search, color: Colors.grey, size: 13),
                                                        ),
                                                        hintText: "Find in albums",
                                                        hintStyle: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),
                                                      )
                                                    )
                                                  )
                                                )
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(right: 15),
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[800],
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    child: Center(child: Text("Filters",style:TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)))
                                                  )
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Image.asset("assets/album-1.jpeg"),                      
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Overnight",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Parcels",style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Image.asset("assets/album-2.jpeg"),                      
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Deux Frères",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("PNL",style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Image.asset("assets/album-3.jpeg"),                      
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Face Value",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Phil Collins",style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: Container(
                                                child: Text("Recommended albums",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                              )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 5),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if(_expendIcon.icon == FontAwesomeIcons.caretDown)
                                                        _expendIcon = FaIcon(FontAwesomeIcons.caretUp,size: 15,color: Colors.white);                     
                                                      else
                                                        _expendIcon = FaIcon(FontAwesomeIcons.caretDown,size: 15,color: Colors.white);                       
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      color: Colors.grey[800]
                                                    ),
                                                    child: Center(child: _expendIcon),
                                                  ),
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                      _showRecommendedSentence(),
                                      Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                      _showRecommendedAlbums()
                                    ]
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      )
                    )
                  )            
                ),
                Container(
                  child: DefaultTabController(
                    length: 3,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width/3 * 2,
                              child: TabBar(
                                isScrollable: true,
                                labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                indicatorColor: Colors.green,
                                labelColor: Colors.white,
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colors.grey[600],
                                indicatorWeight: 2,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      child: Text("Episodes")
                                    )
                                  ),
                                  Tab(
                                    child: Container(
                                      child: Text("Downloads")
                                    )
                                  ),
                                  Tab(
                                    child: Container(
                                      child: Text("Shows")
                                    )
                                  )
                                ]
                              )
                            )
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset("assets/your-episodes.gif")
                                                )
                                              )
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("Your Episodes",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text("3 episodes",style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 15),
                                        alignment: Alignment.centerLeft,
                                        child: Text("Unplayed",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold))
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                                      Expanded(
                                        child: Container(
                                          child: ListView.separated(
                                            separatorBuilder: (BuildContext context, int index) => Divider(
                                              color: Colors.white,
                                            ),
                                            shrinkWrap: true,
                                            itemCount: 6,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {

                                              String episodeName = (index % 3 == 0) ? "Cyrus North #53" : "S06E02 - Ollie and The Alien";
                                              String episodeArtist = (index % 3 == 0) ? "301 vues" : "Floodcast";
                                              String episodeResume = (index % 3 == 0) ? "In this episode, Cyprien, Maghla and Pierre Lapin receive the vulgarisator Cyrus North" : "With David Combat and Davy Mourier. OLLIE and The Alien is available evrywhere";
                                              String episodeDate = (index % 3 == 0) ? "Thu • 1hr,32 min" : "14 sep 2020 • 54 min";
                                              String episodeImg = (index % 3 == 0) ? "assets/podcast-episode-1.jpeg" : "assets/podcast-episode-2.jpeg";
                                  
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              padding: EdgeInsets.all(5),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(8),
                                                                child: Image.asset(episodeImg)
                                                              )
                                                            )
                                                          ),
                                                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Container(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Text(episodeName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                                  ),
                                                                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Text(episodeArtist,style: TextStyle(color: Colors.grey,fontSize: 11))
                                                                  )
                                                                ]
                                                              )
                                                            )
                                                          )
                                                        ]
                                                      )
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Text(episodeResume,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(episodeDate,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 8,
                                                            child: Container(
                                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  FaIcon(FontAwesomeIcons.check,color: Colors.grey,size: 20),
                                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                                                  FaIcon(FontAwesomeIcons.plusCircle,color: Colors.grey,size: 20),
                                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                                                  FaIcon(FontAwesomeIcons.arrowCircleDown,color: Colors.grey,size: 20),
                                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                                                  FaIcon(FontAwesomeIcons.ellipsisH,color: Colors.grey,size: 20),
                                                                ]
                                                              )
                                                            )
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              padding: EdgeInsets.symmetric(horizontal: 2),
                                                              child: CircleAvatar(
                                                                radius: 15,
                                                                backgroundColor: Colors.white,
                                                                child:  FaIcon(FontAwesomeIcons.play,color: Colors.grey[900],size: 10),
                                                              )
                                                            )
                                                          )
                                                        ]
                                                      )
                                                    )
                                                  ]
                                                )
                                              );
                                            }
                                          )
                                        )
                                      )
                                    ]
                                  )
                                ),
                                Container(
                                  child: ListView.separated(
                                    separatorBuilder: (BuildContext context, int index) => Divider(
                                      color: Colors.white,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 6,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {

                                      String episodeName = (index % 3 == 0) ? "Cyrus North #53" : "S06E02 - Ollie and The Alien";
                                      String episodeArtist = (index % 3 == 0) ? "301 vues" : "Floodcast";
                                      String episodeResume = (index % 3 == 0) ? "In this episode, Cyprien, Maghla and Pierre Lapin receive the vulgarisator Cyrus North" : "With David Combat and Davy Mourier. OLLIE and The Alien is available evrywhere";
                                      String episodeDate = (index % 3 == 0) ? "Thu • 1hr,32 min" : "14 sep 2020 • 54 min";
                                      String episodeImg = (index % 3 == 0) ? "assets/podcast-episode-1.jpeg" : "assets/podcast-episode-2.jpeg";
                          
                                      return Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: Image.asset(episodeImg)
                                                      )
                                                    )
                                                  ),
                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Text(episodeName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                          ),
                                                          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                          Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Text(episodeArtist,style: TextStyle(color: Colors.grey,fontSize: 11))
                                                          )
                                                        ]
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              child: Text(episodeResume,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              alignment: Alignment.centerLeft,
                                              child: Text(episodeDate,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          FaIcon(FontAwesomeIcons.solidCheckCircle,color: Colors.green,size: 20),
                                                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                                          FaIcon(FontAwesomeIcons.arrowCircleDown,color: Colors.green,size: 20),
                                                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                                          FaIcon(FontAwesomeIcons.ellipsisH,color: Colors.grey,size: 20),
                                                        ]
                                                      )
                                                    )
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 2),
                                                      child: CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor: Colors.white,
                                                        child:  FaIcon(FontAwesomeIcons.play,color: Colors.grey[900],size: 10),
                                                      )
                                                    )
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
                                Container(
                                  child: ListView.builder(
                                    shrinkWrap: false,
                                    itemCount: 20,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index) {

                                      String podcastName = (index % 3 == 0) ? "301 vues" : "FloodCast";
                                      String podcastArtist = (index % 3 == 0) ? "Updated 18 Mar 2021 • Cyprien" : "Updated 8 Feb 2021 • FloodCast";
                                      String podcastImg = (index % 3 == 0) ? "assets/podcast-logo-1.jpeg" : "assets/podcast-logo-2.jpeg";
                            
                                      return Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset(podcastImg)
                                                )                 
                                              )
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text(podcastName,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold))
                                                    ),
                                                    Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Text(podcastArtist,style: TextStyle(color: Colors.grey,fontSize: 11))
                                                    )
                                                  ]
                                                )
                                              )
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
                        ]
                      )
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}