import 'package:flutter/material.dart';
import 'package:submission1/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  waitFor3Sec() async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    waitFor3Sec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo.png",
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Positioned(
              bottom: 150,
              left: 100,
              right: 100,
              child: Text(
                "Agus Music",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontFamily: "impact"),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Positioned(
              left: 100,
              bottom: 50,
              right: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
