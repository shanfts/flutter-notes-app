import 'package:NotedUp/ui/widget/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const Positioned(
            left: 50,
            right: 50,
            bottom:
                30, // Adjust this value to change how high the navigation bar floats
            child: AppBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
