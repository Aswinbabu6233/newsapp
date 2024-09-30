import 'package:flutter/material.dart';
import 'package:newsapp/view/categoryscreen/categoryscreen.dart';
import 'package:newsapp/view/homescreen/homepage.dart';
import 'package:newsapp/view/searchscreen/searchscreen.dart';

class Bottomnavcontroller extends ChangeNotifier {
  int selectedindex = 0;

  void ontapitem(index) {
    selectedindex = index;
    notifyListeners();
  }

  List<Widget> pages = [Homepage(), Categoryscreen(), Searchscreen()];
}
