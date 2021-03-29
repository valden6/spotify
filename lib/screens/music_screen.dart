import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  FaIcon _playButton = FaIcon(FontAwesomeIcons.solidPlayCircle,color: Colors.white,size: 50);
  FaIcon _redoButton = FaIcon(FontAwesomeIcons.redo,color: Colors.grey,size: 15);
  FaIcon _likedButton = FaIcon(FontAwesomeIcons.solidHeart,color: Colors.green);

  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onDurationChanged.listen((Duration d) {
      if(mounted) setState(() => _duration = d);
    });

    audioPlayer.onAudioPositionChanged.listen((Duration  p) {
      if(mounted) setState(() => _position = p);
    });
  }

  playAudio(String track){
    return audioCache.play(track);
  }

  pauseAudio(){
    return audioPlayer.pause();
  }

  resumeAudio(){
    return audioPlayer.resume();
  }

  stopAudio(){
    return audioPlayer.stop();
  }

  loopAudio(String track,bool activated){
    if(activated)
      return audioCache.loop(track);
    else
    return null;
  }

  Widget slider() {
    return SliderTheme(
      data: SliderThemeData(
        valueIndicatorColor: Colors.red,
        trackHeight: 2,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
      ),
      child: Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          if(mounted){
            setState(() {
            seekToSecond(value.toInt());
            value = value;
            });
          }
        },
        inactiveColor: Colors.grey,
        activeColor: Colors.white,
      )
    );
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  String calculDuration(Duration duration){
    String res;
    res = (duration.inSeconds/60).toStringAsFixed(2);
    return res;
  } 

  String calculPosition(Duration duration){
    String res;
    int min;
    int sec;

    if(duration.inSeconds < 60){
      min = 0;
      sec = duration.inSeconds%60;
    } else {
      min = (duration.inSeconds)~/60;
      sec = duration.inSeconds%60;
    }

    if(duration.inSeconds%60 < 10)
      res = min.toString() + ".0" + sec.toString();
    else
      res = min.toString() + "." + sec.toString();

    return res;
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            child: Center(child: FaIcon(FontAwesomeIcons.chevronDown,color: Colors.grey,size: 20))
                          ),
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Center(child: Text("Liked Songs",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: FaIcon(FontAwesomeIcons.ellipsisH,color: Colors.grey,size: 20))
                        )
                      )
                    ]
                  )
                )
              ),
              Expanded(
                flex: 8,
                child: Container(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          child: Image.asset("assets/reco-album-1.jpeg")
                        )
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Shooting Stars", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21))
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Kazzey, Sally Green • Night City", style: TextStyle(color: Colors.grey,fontSize: 16))
                                      )
                                    ]
                                  )
                                ),
                              )
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    if(_likedButton.icon == FontAwesomeIcons.solidHeart){
                                      if(mounted){
                                        setState(() {
                                        _likedButton = FaIcon(FontAwesomeIcons.heart,color: Colors.white);
                                        });
                                      }
                                    } else {
                                      if(mounted){
                                        setState(() {
                                        _likedButton = FaIcon(FontAwesomeIcons.solidHeart,color: Colors.green);
                                        });
                                      }
                                    }
                                  },
                                  child: Center(child: _likedButton)
                                )
                              )
                            )
                          ]
                        )
                      ),
                      Container(
                        child: Column(
                          children: [
                            slider(),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(calculPosition(_position),style: TextStyle(color: Colors.white,fontSize: 9)),
                                  Text(calculDuration(_duration),style: TextStyle(color: Colors.white,fontSize: 9))
                                ]
                              )
                            )
                          ]
                        )
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(FontAwesomeIcons.random,color: Colors.grey,size: 15),
                            GestureDetector(
                              onTap: () {
                                playAudio("body-gold-oh-wonder.mp3");
                              },
                              child: FaIcon(FontAwesomeIcons.stepBackward,color: Colors.white,size: 25)
                            ),
                            GestureDetector(
                              onTap: () {
                                if(_duration == (Duration(seconds: 0))) {
                                  playAudio("body-gold-oh-wonder.mp3");
                                  if(mounted){
                                    setState(() {
                                      _playButton = FaIcon(FontAwesomeIcons.solidPauseCircle,color: Colors.white,size: 50);                                 
                                    });
                                  }
                                } else if (_playButton.icon == FontAwesomeIcons.solidPauseCircle){
                                  if(mounted){
                                    setState(() {
                                      _playButton = FaIcon(FontAwesomeIcons.solidPlayCircle,color: Colors.white,size: 50);                                 
                                    });
                                  }
                                  pauseAudio();
                                } else {
                                  if(mounted){
                                    setState(() {
                                      _playButton = FaIcon(FontAwesomeIcons.solidPauseCircle,color: Colors.white,size: 50);                                 
                                    });
                                  }
                                  resumeAudio();
                                }
                              },
                              child: _playButton
                            ),
                            FaIcon(FontAwesomeIcons.stepForward,color: Colors.white,size: 25),
                            GestureDetector(
                              onTap: () {
                                if (_redoButton.color == Colors.green){
                                  if(mounted){
                                    setState(() {
                                      _redoButton = FaIcon(FontAwesomeIcons.redo,color: Colors.grey,size: 15);                                 
                                    });
                                  }
                                  loopAudio("body-gold-oh-wonder.mp3",true);
                                } else {
                                  if(mounted){
                                    setState(() {
                                      _redoButton = FaIcon(FontAwesomeIcons.redo,color: Colors.green,size: 15);                                 
                                    });
                                  }
                                  loopAudio("body-gold-oh-wonder.mp3",true);
                                }
                              },
                              child: _redoButton
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: FaIcon(FontAwesomeIcons.slidersH,color: Colors.grey,size: 20))
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: FaIcon(FontAwesomeIcons.list,color: Colors.grey,size: 20))
                        )
                      )
                    ]
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}