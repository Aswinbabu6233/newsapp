import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/controller/homeScreenController.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

class NewsDetailpage extends StatelessWidget {
  final String imageurl;
  final String published;
  final DateTime dateTime;
  final String titile;
  final String discription;
  final String content;
  final String url;

  const NewsDetailpage(
      {super.key,
      required this.imageurl,
      required this.published,
      required this.dateTime,
      required this.titile,
      required this.discription,
      required this.content,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colos.backgroundcolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                titile,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${DateFormat('dd/MM/yyyy').format(dateTime!).toString()}'),
                  Text("Published by: $published")
                ],
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageurl), fit: BoxFit.contain)),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discription,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<Homescreencontroller>(context, listen: false)
                          .launchURL(url);
                    },
                    child: Text(
                      'Click here to Read more...',
                      style: TextStyle(
                          color: Colos.buttoncolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
