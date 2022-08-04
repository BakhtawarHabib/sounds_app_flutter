import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sounds_app_flutter/customPlayer.dart';
import 'package:sounds_app_flutter/model/homeModel.dart';
import 'package:sounds_app_flutter/model/toiletModel.dart';

import 'constants/colors.dart';
import 'model/scarymodel.dart';

class ToiletHome extends StatefulWidget {
  const ToiletHome({Key? key}) : super(key: key);

  @override
  State<ToiletHome> createState() => _ToiletHomeState();
}

class _ToiletHomeState extends State<ToiletHome> {
  HomeModel homeData = HomeModel();
  ToiletModel toiletModel = ToiletModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: whitecolor,
          title: Text(
            'Toilet Sounds',
            style: GoogleFonts.mochiyPopOne(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: toiletModel.toiletModelData.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(
                        builder: (context) => CustomPlayerScreen(
                              audio: toiletModel.toiletModelData[index]
                                  ["sound"],
                              title: toiletModel.toiletModelData[index]["name"],
                              color: homeData.myProducts[4]["color"],
                              icon: homeData.myProducts[4]["image"],
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
                        color: homeData.myProducts[4]["color"],
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
                                  homeData.myProducts[4]["image"],
                                ),
                              ),
                            ),
                            Text(
                              toiletModel.toiletModelData[index]["name"],
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
