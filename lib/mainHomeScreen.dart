import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sounds_app_flutter/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';
import 'main.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobBannerSize? bannerSize;
  late AdmobInterstitial interstitialAd;
  late AdmobReward rewardAd;

  @override
  void initState() {
    super.initState();

    // You should execute `Admob.requestTrackingAuthorization()` here before showing any ad.

    bannerSize = AdmobBannerSize.BANNER;

    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId()!,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        // handleEvent(event, args, 'Interstitial');
      },
    );

    rewardAd = AdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId()!,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
        // handleEvent(event, args, 'Reward');
      },
    );

    interstitialAd.load();
    rewardAd.load();
  }

  _ratingMethod() {
    if (Platform.isAndroid || Platform.isIOS) {
      final appId =
          Platform.isAndroid ? 'YOUR_ANDROID_PACKAGE_ID' : 'YOUR_IOS_APP_ID';
      final url = Uri.parse(
        Platform.isAndroid
            ? "market://details?id=$appId"
            : "https://apps.apple.com/app/id$appId",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
  // void handleEvent(
  //     AdmobAdEvent event, Map<String, dynamic>? args, String adType) {
  //   switch (event) {
  //     case AdmobAdEvent.loaded:
  //       showSnackBar('New Admob $adType Ad loaded!');
  //       break;
  //     case AdmobAdEvent.opened:
  //       showSnackBar('Admob $adType Ad opened!');
  //       break;
  //     case AdmobAdEvent.closed:
  //       showSnackBar('Admob $adType Ad closed!');
  //       break;
  //     case AdmobAdEvent.failedToLoad:
  //       showSnackBar('Admob $adType failed to load. :(');
  //       break;
  //     case AdmobAdEvent.rewarded:
  //       showDialog(
  //         context: scaffoldState.currentContext!,
  //         builder: (BuildContext context) {
  //           return WillPopScope(
  //             onWillPop: () async {
  //               ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //               return true;
  //             },
  //             child: AlertDialog(
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   const Text('Reward callback fired. Thanks Andrew!'),
  //                   Text('Type: ${args!['type']}'),
  //                   Text('Amount: ${args['amount']}'),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //       break;
  //     default:
  //   }
  // }

  // void showSnackBar(String content) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(content),
  //       duration: const Duration(milliseconds: 1500),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: homeColor,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.jpg"),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: MaterialButton(
                    height: 60,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.blue[900],
                    shape: const StadiumBorder(),
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    child: Text(
                      "Start",
                      style: GoogleFonts.mochiyPopOne(
                          fontSize: 20,
                          color: whitecolor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Share.share("Check out this app");
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[900],
                            maxRadius: 35,
                            child: const Icon(
                              Icons.share,
                              size: 40,
                              color: whitecolor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Share",
                          style: GoogleFonts.mochiyPopOne(
                              fontSize: 17,
                              color: whitecolor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _ratingMethod();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[900],
                            maxRadius: 35,
                            child: const Icon(
                              Icons.star_border,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rate Us",
                          style: GoogleFonts.mochiyPopOne(
                              fontSize: 17,
                              color: whitecolor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: AdmobBanner(
                adUnitId: getBannerAdUnitId()!,
                adSize: bannerSize!,
                listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
                  // handleEvent(event, args, 'Banner');
                },
                onBannerCreated: (AdmobBannerController controller) {
                  // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                  // Normally you don't need to worry about disposing this yourself, it's handled.
                  // If you need direct access to dispose, this is your guy!
                  // controller.dispose();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
