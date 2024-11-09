import 'package:NotedUp/ui/views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BannerAd? _bannerAd;
  bool isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    // _loadBannerAd();
    _navigateToHome();
  }

  // void _loadBannerAd() {
  //   _bannerAd = BannerAd(
  //     adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test Ad Unit ID
  //     size: AdSize.banner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           isBannerAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //         print('Ad failed to load: $error');
  //         // Optionally handle ad loading failure
  //       },
  //     ),
  //   )..load();
  // }

  void _navigateToHome() async {
    // Wait for a few seconds
    await Future.delayed(
        const Duration(seconds: 1)); // Adjust duration as needed

    // Check if the widget is still mounted before navigating
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const HomePage(), // Replace with your HomePage widget
        ),
      );
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 234, 199, 199),
                Color.fromARGB(255, 181, 188, 243),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('img/final-logo-tranparent.png',
                  height: 300, width: 300),
              const SizedBox(height: 20),
              const CircularProgressIndicator(), // Optional: Loading indicator
            ],
          ),
        ),
      ),
    );
  }
}
