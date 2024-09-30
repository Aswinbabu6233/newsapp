import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/splashcontroller.dart';
import 'package:newsapp/utils/Textstyle.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(
      Duration(seconds: 6),
      () {
        splashScreenProvider.setLoading(false);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (splashScreenProvider.isloading)
              ClipRRect(
                child: Image.asset(
                  'assets/images/SplashScreen.gif',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
