import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sozEBay/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    afterSplash();
  }

  void afterSplash() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: devHeight / 3),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
        builder: (BuildContext context, double val, child) {
          return Padding(
            padding: EdgeInsets.only(top: val),
            child: child,
          );
        },
        child: ListView(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: 200,
                height: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "SozEBay",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
