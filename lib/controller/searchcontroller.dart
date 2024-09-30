import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/Newsmodel.dart';

class Searchcontroller extends ChangeNotifier {
  Newsmodel? newsmodel;
  bool isloading = false;
  Future<void> searchData({required String searchdata}) async {
    isloading = true;
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$searchdata&sortBy=publishedAt&apiKey=f085632551f74df980217ba0a8ad9bb4');
    try {
      final Response =
          await http.get(url, headers: {'Content-Type': 'application/json'});
      print(Response.statusCode);
      if (Response.statusCode == 200) {
        final Map<String, dynamic> decodeData = jsonDecode(Response.body);
        newsmodel = Newsmodel.fromJson(decodeData);
      } else {
        print('api failed');
        throw Exception('Api failed');
      }
    } catch (e) {
      print('error $e');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
