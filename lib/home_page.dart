import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sounds_app_flutter/airHornHome.dart';

import 'constants/colors.dart';
import 'main.dart';
import 'model/homeModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModel homeData = HomeModel();
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
  //                   Text('Reward callback fired. Thanks Andrew!'),
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
  //       duration: Duration(milliseconds: 1500),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: whitecolor,
          appBar: AppBar(
            elevation: 0.0,
            leading: const BackButton(
              color: Colors.black,
            ),
            backgroundColor: whitecolor,
            centerTitle: true,
            title: Text(
              'Funny Pranks Sounds',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: homeData.myProducts.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () async {
                        final isLoaded = await rewardAd.isLoaded;

                        if (isLoaded) {
                          rewardAd.show();
                          Navigator.push(
                            context,
                            // ignore: prefer_const_constructors
                            MaterialPageRoute(
                                builder: (context) =>
                                    homeData.myProducts[index]["navigate"]),
                          );
                        } else {
                          Navigator.push(
                            context,
                            // ignore: prefer_const_constructors
                            MaterialPageRoute(
                                builder: (context) =>
                                    homeData.myProducts[index]["navigate"]),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: homeData.myProducts[index]["color"],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 5),
                              CircleAvatar(
                                maxRadius: 40,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                backgroundImage: AssetImage(
                                  homeData.myProducts[index]["image"],
                                ),
                              ),
                              Text(
                                homeData.myProducts[index]["name"],
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.count(2, index.isEven ? 2.5 : 1.7);
                    },
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: AdmobBanner(
                    adUnitId: getBannerAdUnitId()!,
                    adSize: bannerSize!,
                    listener:
                        (AdmobAdEvent event, Map<String, dynamic>? args) {},
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
          )),
    );
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    rewardAd.dispose();
    super.dispose();
  }
}
