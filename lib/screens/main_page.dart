import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:series_app/consts.dart';
import 'package:series_app/models/show.dart';
import 'package:series_app/screens/show_detail.dart';
import 'package:series_app/widgets/series_card.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  getSeriesList() async {
    Uri url = Uri.parse(BASE_URL + "/shows");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      List<Show> showList =
          (jsonBody as List).map((value) => Show.fromJson(value)).toList();
      return showList;
    } else {
      print("Hata oluştu : " + response.statusCode.toString());
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
            color: mainBgColor,
            child: FutureBuilder(
                future:  getSeriesList(),
                builder: (context, snapshot) {
                 var showList = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: showList.length,
                        itemBuilder: (context, index) {
                          return SeriesCard(
                              cardOnTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowDetailPage(
                                              showId:
                                                  showList[index].id.toString(),
                                            )));
                              },
                              showRating: showList[index].rating.average,
                              name: showList[index].name,
                              state: showList[index].status,
                              imgSrc: showList[index].image.original);
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
      ),
    );
  }
}
