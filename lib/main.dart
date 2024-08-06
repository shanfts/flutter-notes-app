import 'package:NotedUp/config/router.dart';
import 'package:NotedUp/cubit/Group.cubit.dart'; // Import your GroupCubit
import 'package:NotedUp/cubit/Note.cubit.dart';
import 'package:NotedUp/ui/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'splash_screen.dart'; // Import the SplashScreen÷

void main() async {
  // Ensure proper initialization of Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar and bottom navigation bar color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors
        .transparent, // Set to transparent if you want the gradient to show through
    statusBarIconBrightness:
        Brightness.dark, // For dark icons on light background
    systemNavigationBarColor:
        Colors.transparent, // Set the color for the navigation bar
    systemNavigationBarIconBrightness:
        Brightness.light, // For dark icons on the navigation bar
  ));

  // Initialize cubits
  final NoteCubit noteCubit = NoteCubit();
  final GroupCubit groupCubit = GroupCubit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NoteCubit>.value(
          value: noteCubit,
        ),
        BlocProvider<GroupCubit>.value(
          value: groupCubit,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSplashScreen();
  }

  Future<void> _loadSplashScreen() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Set the duration of the splash screen
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const MaterialApp(
        home: SplashScreen(),
      );
    }

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'NotedUp.',
      routerConfig: router,
    );
  }
}
