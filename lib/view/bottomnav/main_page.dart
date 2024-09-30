import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/controller/bottomnavcontroller.dart';
import 'package:newsapp/utils/Textstyle.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Provider.of<Bottomnavcontroller>(context)
            .pages[Provider.of<Bottomnavcontroller>(context).selectedindex],
        bottomNavigationBar: CurvedNavigationBar(
            onTap: Provider.of<Bottomnavcontroller>(context).ontapitem,
            index: Provider.of<Bottomnavcontroller>(context).selectedindex,
            height: 50,
            animationDuration: Duration(milliseconds: 400),
            backgroundColor: Colors.transparent,
            color: Colos.appbarcolor,
            items: [
              FaIcon(
                FontAwesomeIcons.house,
                color: Colos.backgroundcolor,
              ),
              FaIcon(
                FontAwesomeIcons.list,
                color: Colos.backgroundcolor,
              ),
              FaIcon(
                FontAwesomeIcons.search,
                color: Colos.backgroundcolor,
              )
            ]));
  }
}
