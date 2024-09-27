import 'package:NotedUp/delegates/NoteSearchDelegate.dart';
import 'package:NotedUp/ui/list/NoteListView.dart';
import 'package:NotedUp/ui/views/printerWidget.dart';
import 'package:NotedUp/ui/widget/BottomNoteModal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.black),
            onPressed: () {
              const PrintWidget(orderNumber: 2, ipAddress: '', port: 'port');
              // final profile = await CapabilityProfile.load();
              // final printer = NetworkPrinter(PaperSize.mm80, profile);

              // final PosPrintResult res =
              //     await printer.connect('192.168.0.123', port: 9100);

              // if (res == PosPrintResult.success) {
              //   await printReceipt(printer);
              //   printer.disconnect();
              // } else {
              //   print('Could not connect to printer');
              // }
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
        child: Stack(
          children: [
            NoteListView(
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
          ],
        ),
      ),
    );
  }
}
