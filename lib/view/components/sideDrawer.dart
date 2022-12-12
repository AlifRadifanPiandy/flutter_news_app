import 'package:flutter/material.dart';
import 'package:flutter_news_app_getx/viewmodel/NewsController.dart';
import 'package:flutter_news_app_getx/model/utils.dart';
import 'package:flutter_news_app_getx/view/components/dropDownList.dart';
import 'package:get/get.dart';

Drawer sideDrawer(NewsController newsController) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.symmetric(vertical: 60),
      children: <Widget>[
        Container(
          child: GetBuilder<NewsController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.cName != ''
                      ? Text("Country = ${controller.cName.value}")
                      : Container(),
                  SizedBox(height: 10),
                  controller.category != ''
                      ? Text("Category = ${controller.category.value}")
                      : Container(),
                  SizedBox(height: 20),
                ],
              );
            },
            init: NewsController(),
          ),
        ),
        ExpansionTile(
          title: Text("Country"),
          children: <Widget>[
            for (int i = 0; i < listOfCountry.length; i++)
              dropDownList(
                call: () {
                  newsController.country.value = listOfCountry[i]['code']!;
                  newsController.cName.value =
                      listOfCountry[i]['name']!.toUpperCase();
                  newsController.getNews();
                  // newsController.update();
                },
                name: listOfCountry[i]['name']!.toUpperCase(),
              ),
          ],
        ),
        ExpansionTile(
          title: Text("Category"),
          children: [
            for (int i = 0; i < listOfCategory.length; i++)
              dropDownList(
                  call: () {
                    newsController.category.value = listOfCategory[i]['code']!;
                    newsController.getNews();
                    // newsController.update();
                  },
                  name: listOfCategory[i]['name']!.toUpperCase())
          ],
        ),
        ListTile(title: Text("Close"), onTap: () => Get.back()),
      ],
    ),
  );
}
