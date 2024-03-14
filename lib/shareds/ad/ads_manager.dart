// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class BannerAdManager {
//   static final BannerAdManager _instance = BannerAdManager._internal();
//   static BannerAdManager get instance => _instance;
//   BannerAdManager._internal();

//   BannerAd? _bannerAd;
//   final adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-8385820706890324/3853020417'
//       : 'ca-app-pub-8385820706890324/7992302321';

//   void loadAd() {
//     _bannerAd = BannerAd(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       size: AdSize.fullBanner,
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {},
//         onAdFailedToLoad: (ad, err) {
//           _bannerAd = null;
//           ad.dispose();
//         },
//       ),
//     )..load();
//   }

//   Widget loadAndShowAd() {
//     loadAd();
//     if (_bannerAd == null) {
//       return Container();
//     }
//     return SafeArea(
//       child: SizedBox(
//         width: _bannerAd!.size.width.toDouble(),
//         height: _bannerAd!.size.height.toDouble(),
//         child: AdWidget(ad: _bannerAd!),
//       ),
//     );
//   }
// }
