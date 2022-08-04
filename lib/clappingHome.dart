import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sounds_app_flutter/customPlayer.dart';
import 'package:sounds_app_flutter/model/burpModel.dart';
import 'package:sounds_app_flutter/model/clappingModel.dart';
import 'package:sounds_app_flutter/model/fartModel.dart';
import 'package:sounds_app_flutter/model/gunModel.dart';
import 'package:sounds_app_flutter/model/homeModel.dart';
import 'constants/colors.dart';

class ClappingHome extends StatefulWidget {
  const ClappingHome({Key? key}) : super(key: key);

  @override
  State<ClappingHome> createState() => _ClappingHomeState();
}

class _ClappingHomeState extends State<ClappingHome> {
  HomeModel homeData = HomeModel();
  ClappingModel clappingModel = ClappingModel();
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
            'Clapping Sounds',
            style: GoogleFonts.mochiyPopOne(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: clappingModel.clappingModelData.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(
                        builder: (context) => CustomPlayerScreen(
                              audio: clappingModel.clappingModelData[index]
                                  ["sound"],
                              title: clappingModel.clappingModelData[index]
                                  ["name"],
                              color: homeData.myProducts[9]["color"],
                              icon: homeData.myProducts[9]["image"],
                            )),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: homeData.myProducts[9]["color"],
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
                                  homeData.myProducts[9]["image"],
                                ),
                              ),
                            ),
                            Text(
                              clappingModel.clappingModelData[index]["name"],
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
