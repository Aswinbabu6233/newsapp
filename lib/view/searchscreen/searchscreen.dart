import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/searchcontroller.dart';
import 'package:newsapp/utils/Textstyle.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/Widget/Home_news_Container.dart';
import 'package:provider/provider.dart';

class Searchscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    Searchcontroller value = Provider.of<Searchcontroller>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colos.backgroundcolor),
                  height: 50,
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        value.searchData(
                            searchdata:
                                textEditingController.text.toLowerCase());
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        size: 26,
                        color: Colos.appbarcolor,
                      )),
                )
              ],
            ),
            Expanded(
                child: Provider.of<Searchcontroller>(context).isloading == true
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
                                title:
                                    value.newsmodel?.articles?[index].title ??
                                        '',
                                imageUrl: value.newsmodel?.articles?[index]
                                        .urlToImage ??
                                    '',
                                source: value.newsmodel?.articles?[index].source
                                        ?.name ??
                                    '',
                                discription: value.newsmodel?.articles?[index]
                                        .description ??
                                    '',
                                url:
                                    value.newsmodel?.articles?[index].url ?? '',
                                dateFormat: value
                                    .newsmodel?.articles?[index].publishedAt,
                                content:
                                    value.newsmodel?.articles?[index].content ??
                                        '',
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount:
                                value.newsmodel?.articles?.length ?? 0))),
          ],
        ),
      )),
    );
  }
}
