import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/homeScreenController.dart';
import 'package:newsapp/utils/Textstyle.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/Widget/Home_news_Container.dart';
import 'package:newsapp/view/searchscreen/searchscreen.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  void fetchdata(BuildContext context) {
    Provider.of<Homescreencontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchdata(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Searchscreen(),
                    ),
                  );
                },
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colos.backgroundcolor,
                  size: 28,
                ))
          ],
          toolbarHeight: 65,
          backgroundColor: Colos.appbarcolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "News Today.",
                style: GoogleFonts.sanchez(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colos.backgroundcolor,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                width: 15,
              ),
              FaIcon(
                FontAwesomeIcons.newspaper,
                size: 28,
                color: Colos.backgroundcolor,
              )
            ],
          ),
        ),
        body: Consumer<Homescreencontroller>(
          builder: (context, value, child) {
            return value.isloading == true
                ? Center(
                    child: LottieBuilder.asset(
                      fit: BoxFit.cover,
                      "assets/animations/loadingfeed.json",
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return HomeNewsContainer(
                            title: value.newsmodel.articles?[index].title
                                    .toString() ??
                                '',
                            imageUrl: value
                                    .newsmodel.articles?[index].urlToImage
                                    .toString() ??
                                '',
                            source: value
                                    .newsmodel.articles?[index].source?.name
                                    .toString() ??
                                '',
                            discription: value
                                    .newsmodel.articles?[index].description
                                    .toString() ??
                                '',
                            url: value.newsmodel.articles?[index].url
                                    .toString() ??
                                '',
                            dateFormat:
                                value.newsmodel.articles?[index].publishedAt,
                            content: value.newsmodel.articles?[index].content
                                    .toString() ??
                                '',
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: value.newsmodel.articles?.length ?? 0));
          },
        ));
  }
}
