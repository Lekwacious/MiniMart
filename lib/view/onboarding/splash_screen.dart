import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimart/utils/app_colors.dart';

import '../dashboard/bottom_tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Animation<double> animation;

  bool? installed = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeNavigationBar(
                page: 0,
              )));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("MiniMart By Alphatwelve",
                  style: GoogleFonts.ibmPlexSans(
                    textStyle:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: appButtonColor,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
