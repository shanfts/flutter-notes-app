import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  BannerAd? _bannerAd;
  bool isBannerAdLoaded = false;

  // Method to load banner ads
  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test Ad Unit ID
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad failed to load: $error');
          isBannerAdLoaded = false;
        },
      ),
    )..load();
  }

  // Method to load ads for splash screen or main.dart
  void loadSplashScreenAd() {
    // You can customize this method to load different ad types if needed
    loadBannerAd();
  }

  // Method to get the banner ad widget
  Widget getBannerAdWidget() {
    if (isBannerAdLoaded && _bannerAd != null) {
      return SizedBox(
        height: _bannerAd!.size.height.toDouble(),
        width: _bannerAd!.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return Container(); // Return an empty container if the ad is not loaded
  }

  void dispose() {
    _bannerAd?.dispose();
  }
}
