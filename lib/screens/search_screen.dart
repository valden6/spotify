import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[900],
          centerTitle: false,
          flexibleSpace: Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Search", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white))
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white
                            ),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                prefixIconConstraints: BoxConstraints(minWidth: 30),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left:10, right: 10),
                                  child: FaIcon(FontAwesomeIcons.search, color: Colors.black, size: 20),
                                ),
                                hintText: "Artists, songs, or podcasts",
                                hintStyle: TextStyle(color: Colors.black),
                              )
                            )
                          )
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: FaIcon(FontAwesomeIcons.camera,size: 20,color: Colors.white))
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text("Your top genres",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold))
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  child: Image.asset("assets/pop.jpeg",fit: BoxFit.fill)
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  child: Text("Pop",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
                                )
                              ]
                            )
                          )
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  child: Image.asset("assets/rap.jpeg",fit: BoxFit.fill)
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  child: Text("Hip Hop",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
                                )
                              ]
                            )
                          )
                        )
                      ]
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 6)),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  child: Image.asset("assets/grand-hit.jpeg",fit: BoxFit.fill)
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  child: Text("French Pop",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
                                )
                              ]
                            )
                          )
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.all(20),
                                  height: 100,
                                  child: Image.asset("assets/rock.jpeg",fit: BoxFit.fill)
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10,top: 10),
                                  child: Text("Rock",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
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
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Text("Browse all",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold))
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.75,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {

                    String genreName = (index % 3 == 0) ? "Classical" : "In the car";
                    String genrePic = (index % 3 == 0) ? "assets/classical.jpeg" : "assets/drive.jpeg";
                    Color genreColor = (index % 3 == 0) ? Colors.deepPurple[200] : Colors.lightGreen;
                        
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                      decoration: BoxDecoration(
                        color: genreColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(20),
                            height: 100,
                            child: Image.asset(genrePic,fit: BoxFit.fill)
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10,top: 10),
                            child: Text(genreName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
                          )
                        ]
                      )
                    );
                  }
                )
              )
            ]
          )
        ),
      )
    );
  }
}