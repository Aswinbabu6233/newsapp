import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/controller/homeScreenController.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/Widget/news_detailpage.dart';
import 'package:newsapp/view/categoryscreen/categoryscreen.dart';
import 'package:provider/provider.dart';

class HomeNewsContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String source;
  final String discription;
  final String content;

  final String url;
  final DateTime? dateFormat;

  const HomeNewsContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.discription,
    required this.url,
    required this.dateFormat,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailpage(
                        imageurl: imageUrl,
                        published: source,
                        dateTime: dateFormat!,
                        titile: title,
                        discription: discription,
                        content: content,
                        url: url,
                      ),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    discription,
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  Text(
                    "Published by: ${source}",
                    style: TextStyle(color: Colos.buttoncolor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date: ${DateFormat('dd//MM/yyyy').format(dateFormat!).toString() ?? ''}",
                        style: TextStyle(color: Colos.buttoncolor),
                      ),
                      GestureDetector(
                          onTap: () {
                            String newsToShare =
                                "$title \n \n $discription \n \n $url";

                            Provider.of<Homescreencontroller>(context,
                                    listen: false)
                                .Sharenews(texttoShare: newsToShare);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.share,
                            color: Colos.buttoncolor,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
