import 'package:NotedUp/services/google_ads.dart';
import 'package:NotedUp/ui/list/GroupListVIew.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final AdManager _adManager = AdManager(); // Create an instance of AdManager

  @override
  void initState() {
    super.initState();
    _loadBannerAdWithDelay(); // Load the ad with a delay
  }

  void _loadBannerAdWithDelay() {
    _adManager.loadBannerAd(); // Load the ad
    // Introduce a delay to allow the ad to load before refreshing the UI
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {}); // Refresh the UI
    });
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: const Icon(
          Icons.tag,
          color: Colors.black,
        ),
        title: const Text('Groups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              GoRouter.of(context).push('/add-group');
            },
          ),
        ],
      ),
      body: Container(
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
          children: [
            // Display the banner ad
            Expanded(
              // flex: 0,
              child: GroupListVIew(
                onTap: (group) {
                  GoRouter.of(context).push('/group', extra: group);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 120,
              ),
              child: _adManager.getBannerAdWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
