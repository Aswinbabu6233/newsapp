import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/Newsmodel.dart';

class CategoruController extends ChangeNotifier {
  late Newsmodel newsmodel;
  bool isloading = false;
  List<String> Categorylist = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = 'business';
  onTap({required int index}) {
    category = Categorylist[index].toLowerCase();
    fetchData();
    notifyListeners();
  }

  fetchData() async {
    isloading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f085632551f74df980217ba0a8ad9bb4");
    final response = await http.get(url);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      throw Exception('Api failed');
    }
    newsmodel = Newsmodel.fromJson(decodeData);
    isloading = false;
    notifyListeners();
  }
}
