import 'package:flutter/services.dart';

class IronSourceService {
  static final IronSourceService _instance = IronSourceService._internal();
  factory IronSourceService() => _instance;
  IronSourceService._internal();

  static const MethodChannel _channel =
      MethodChannel('com.digitalhelp.NotedUp/ads');
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _channel.invokeMethod('initialize', {});
      _isInitialized = true;
    } catch (e) {
      print('Ad initialization error: $e');
    }
  }

  Future<void> loadBannerAd() async {
    try {
      await _channel.invokeMethod('loadBanner', {
        'adUnitId': 'hw0e6z7k8xtbp4uh', // Test ad unit ID
      });
    } catch (e) {
      print('Banner ad load error: $e');
    }
  }

  Future<void> loadInterstitialAd() async {
    try {
      await _channel.invokeMethod('loadInterstitial', {
        'adUnitId': '2uk7lddykr32ki58', // Test ad unit ID
      });
    } catch (e) {
      print('Interstitial ad load error: $e');
    }
  }

  Future<void> showInterstitialAd() async {
    try {
      await _channel.invokeMethod('showInterstitial', {});
    } catch (e) {
      print('Interstitial ad show error: $e');
    }
  }

  Future<void> hideBannerAd() async {
    try {
      await _channel.invokeMethod('hideBanner', {});
    } catch (e) {
      print('Banner ad hide error: $e');
    }
  }
}
