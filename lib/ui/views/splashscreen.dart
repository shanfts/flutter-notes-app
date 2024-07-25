import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              const Text('data'),
              // Replace with your app logo or any other widget
              Image.asset('assets/logo.png', height: 100, width: 100),
              const SizedBox(height: 20),
              const CircularProgressIndicator(), // Optional: Loading indicator
            ],
          ),
        ),
      ),
    );
  }
}
