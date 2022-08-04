import 'package:flutter/material.dart';
import 'package:sounds_app_flutter/airHornHome.dart';
import 'package:sounds_app_flutter/breakSoundHome.dart';
import 'package:sounds_app_flutter/burpHome.dart';
import 'package:sounds_app_flutter/clappingHome.dart';
import 'package:sounds_app_flutter/fartHome.dart';
import 'package:sounds_app_flutter/gunHome.dart';
import 'package:sounds_app_flutter/toiletHome.dart';

import '../policeHome.dart';
import '../scaryhome.dart';
import '../sneezeHome.dart';

class HomeModel {
  List<Map> myProducts = [
    {
      "name": "Airhorn",
      "image": "assets/images/horn.png",
      "color": const Color(0xff9da2ff),
      "navigate": const AirHornHome()
    },
    {
      "name": "Sneezing",
      "image": "assets/images/sneezing.png",
      "color": const Color(0xffff9065),
      "navigate": const SneezeHome()
    },
    {
      "name": "Police",
      "image": "assets/images/police_icon.png",
      "color": const Color(0xffff7fa5),
      "navigate": const PoliceHome()
    },
    {
      "name": "Scary",
      "image": "assets/images/scary.png",
      "color": const Color(0xff85f1d9),
      "navigate": const ScaryHome()
    },
    {
      "name": "Toilet",
      "image": "assets/images/toilet.png",
      "color": Colors.black,
      "navigate": const ToiletHome()
    },
    {
      "name": "Break",
      "image": "assets/images/breakplate.png",
      "color": Colors.purple,
      "navigate": const BreakSoundHome()
    },
    {
      "name": "Burp",
      "image": "assets/images/burpicon.png",
      "color": Colors.teal,
      "navigate": const BurpHome()
    },
    {
      "name": "Fart",
      "image": "assets/images/farticon.png",
      "color": Colors.blue,
      "navigate": const FartHome()
    },
    {
      "name": "Gun",
      "image": "assets/images/gunicon.png",
      "color": Colors.indigo,
      "navigate": const GunHome()
    },
    {
      "name": "Clapping",
      "image": "assets/images/clapicon.png",
      "color": Colors.brown,
      "navigate": const ClappingHome()
    },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": const Color(0xffffcf66),
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": const Color(0xffff7fa5),
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": const Color(0xff60e1c2),
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": const Color(0xff75c6fe),
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": const Color(0xff1e2050),
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.red,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.yellow,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.orange,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.deepPurple,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.pink,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.lime,
    //   "navigate": const AirHornHome()
    // },
    // {
    //   "name": "Sneezing",
    //   "image": "assets/images/sneezing.png",
    //   "color": Colors.cyan,
    //   "navigate": const AirHornHome()
    // },
  ];
}
