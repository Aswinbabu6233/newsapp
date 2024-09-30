import 'package:flutter/material.dart';
import 'package:newsapp/controller/bottomnavcontroller.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/controller/homeScreenController.dart';
import 'package:newsapp/controller/searchcontroller.dart';
import 'package:newsapp/controller/splashcontroller.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/bottomnav/main_page.dart';
import 'package:newsapp/view/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Bottomnavcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Homescreencontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoruController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Searchcontroller(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colos.backgroundcolor),
        debugShowCheckedModeBanner: false,
        home: Consumer<SplashScreenProvider>(
          builder: (context, splashScreenProvider, child) {
            return splashScreenProvider.isloading ? Splashscreen() : MainPage();
          },
        ),
      ),
    );
  }
}
