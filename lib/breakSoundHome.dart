import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sounds_app_flutter/customPlayer.dart';
import 'package:sounds_app_flutter/model/breaksoundModel.dart';
import 'package:sounds_app_flutter/model/homeModel.dart';

import 'constants/colors.dart';
import 'model/scarymodel.dart';

class BreakSoundHome extends StatefulWidget {
  const BreakSoundHome({Key? key}) : super(key: key);

  @override
  State<BreakSoundHome> createState() => _BreakSoundHomeState();
}

class _BreakSoundHomeState extends State<BreakSoundHome> {
  HomeModel homeData = HomeModel();
  BreakSoundModel breakSoundModel = BreakSoundModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: whitecolor,
          title: Text(
            'Break Sounds',
            style: GoogleFonts.mochiyPopOne(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: breakSoundModel.breakModelData.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(
                        builder: (context) => CustomPlayerScreen(
                              audio: breakSoundModel.breakModelData[index]
                                  ["sound"],
                              title: breakSoundModel.breakModelData[index]
                                  ["name"],
                              color: homeData.myProducts[5]["color"],
                              icon: homeData.myProducts[5]["image"],
                            )),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: homeData.myProducts[5]["color"],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                backgroundImage: AssetImage(
                                  homeData.myProducts[5]["image"],
                                ),
                              ),
                            ),
                            Text(
                              breakSoundModel.breakModelData[index]["name"],
                              style: GoogleFonts.mochiyPopOne(
                                fontSize: 14,
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: whitecolor,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
