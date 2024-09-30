import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/Newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Homescreencontroller extends ChangeNotifier {
  late Newsmodel newsmodel;
  bool isloading = false;
  var baseUrl = 'https://newsapi.org';

  fetchData() async {
    isloading = true;
    var response = await http.get(Uri.parse(
        '$baseUrl/v2/top-headlines?country=us&apiKey=f085632551f74df980217ba0a8ad9bb4'));
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

  void Sharenews({String texttoShare = ''}) {
    try {
      Share.share(texttoShare);
    } catch (e) {
      print('Error sharing $e');
    }
    notifyListeners();
  }

  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        print('Error launching URL $url');
      }
    } catch (e) {
      print('Error launching URL $e');
    }
    notifyListeners();
  }
}
