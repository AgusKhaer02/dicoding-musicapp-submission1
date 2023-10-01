import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:submission1/screens/splash_screen.dart';

import 'screens/main_screen.dart';

main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black45,
        primaryColor: Colors.black45,
        primaryColorDark: Colors.black45,
        indicatorColor: Colors.white,
        primaryTextTheme: Typography.whiteMountainView,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black45, foregroundColor: Colors.white),
      ),
      home: const SplashScreen(),
    );
  }
}
