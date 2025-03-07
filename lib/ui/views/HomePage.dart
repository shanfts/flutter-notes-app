import 'package:NotedUp/delegates/NoteSearchDelegate.dart';
import 'package:NotedUp/services/iron_source_service.dart';
import 'package:NotedUp/ui/list/NoteListView.dart';
import 'package:NotedUp/ui/widget/BottomNoteModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IronSourceService _ironSourceService = IronSourceService();

  @override
  void initState() {
    super.initState();
    _initializeAds();
  }

  @override
  void dispose() {
    _ironSourceService.hideBannerAd();
    super.dispose();
  }

  Future<void> _initializeAds() async {
    await _ironSourceService.initialize();
    await _ironSourceService.loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'img/smallLogo.png',
          height: 25,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              GoRouter.of(context).push('/add');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(),
              );
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
            Expanded(
              child: NoteListView(
                onLongPress: (note) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomNoteModal(
                        note: note,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ), // Space for banner ad
          ],
        ),
      ),
    );
  }
}
