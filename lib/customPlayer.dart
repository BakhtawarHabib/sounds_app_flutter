import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

class CustomPlayerScreen extends StatefulWidget {
  String audio;
  String title;
  Color color;
  String icon;
  CustomPlayerScreen(
      {required this.audio,
      required this.title,
      required this.color,
      required this.icon});
  @override
  _CustomPlayerScreenState createState() => _CustomPlayerScreenState();
}

class _CustomPlayerScreenState extends State<CustomPlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
      iconController; // make sure u have flutter sdk > 2.12.0 (null safety)
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    audioPlayer.open(Audio(widget.audio),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: whitecolor,
          title: Text(
            widget.title,
            style: GoogleFonts.mochiyPopOne(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 130,
                backgroundColor: widget.color,
                backgroundImage: AssetImage(widget.icon),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Icon(
                      CupertinoIcons.backward_fill,
                      size: 40,
                    ),
                    onTap: () {
                      audioPlayer.seekBy(const Duration(seconds: -10));
                    },
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      AnimateIcon();
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: iconController,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    child: const Icon(
                      CupertinoIcons.forward_fill,
                      size: 40,
                    ),
                    onTap: () {
                      audioPlayer.seekBy(const Duration(seconds: 10));
                      audioPlayer.seek(const Duration(seconds: 10));
                      audioPlayer.next();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        iconController.forward();
        audioPlayer.play();
      } else {
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
