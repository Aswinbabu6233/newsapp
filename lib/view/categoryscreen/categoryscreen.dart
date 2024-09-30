import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/categorycontroller.dart';
import 'package:newsapp/utils/Textstyle.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/Widget/Home_news_Container.dart';
import 'package:provider/provider.dart';

class Categoryscreen extends StatelessWidget {
  void fetchData(BuildContext context) async {
    Provider.of<CategoruController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Consumer<CategoruController>(
      builder: (context, value, child) {
        return DefaultTabController(
            length: value.Categorylist.length,
            initialIndex: 0,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colos.backgroundcolor,
                  toolbarHeight: 65,
                  title: Text(
                    "Category.",
                    style: GoogleFonts.sanchez(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colos.appbarcolor,
                        fontStyle: FontStyle.italic),
                  ),
                  bottom: TabBar(
                      onTap: (item) {
                        value.onTap(index: item);
                      },
                      dividerColor: Colos.backgroundcolor,
                      labelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      labelColor: Colos.buttoncolor,
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colos.appbarcolor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colos.appbarcolor, width: 2)),
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: List.generate(
                        value.Categorylist.length,
                        (index) => Tab(
                          text: value.Categorylist[index],
                        ),
                      )),
                ),
                body: value.isloading == true
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
                                dateFormat: value
                                    .newsmodel.articles?[index].publishedAt,
                                content: value
                                        .newsmodel.articles?[index].content
                                        .toString() ??
                                    '',
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount:
                                value.newsmodel.articles?.length ?? 0))));
      },
    );
  }
}
