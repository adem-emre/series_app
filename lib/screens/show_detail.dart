import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:series_app/consts.dart';
import 'package:series_app/functions.dart';
import 'package:series_app/models/show_with_cast.dart' as showWithCast;
import 'package:series_app/widgets/cast_card.dart';
import 'package:series_app/widgets/rating_bar.dart';

class ShowDetailPage extends StatefulWidget {
  String showId;

  ShowDetailPage({@required this.showId});
  @override
  _ShowDetailPageState createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  Future<showWithCast.ShowWithCast> getShowInfo() async {
    try {
      Uri url = Uri.parse(BASE_URL + "/shows/${widget.showId}?embed=cast");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var showInfo =
          showWithCast.ShowWithCast.fromJson(jsonDecode(response.body));
      return showInfo;
    }      
    } catch (e) {
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: getPhoneWidth(context),
            color: mainBgColor,
            child: FutureBuilder(
                future: getShowInfo(),
                builder: (context,
                    AsyncSnapshot<showWithCast.ShowWithCast> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      var error = snapshot.error;
                      Fluttertoast.showToast(
                          msg: "Bir Hata Oluştu : " + error.toString());
                      return Container();
                    } else {
                      showWithCast.ShowWithCast showWithCastInfo =
                          snapshot.data;
                      return returnShowInfo(context, showWithCastInfo);
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ),
    );
  }

  returnShowInfo(
    BuildContext context,
    showWithCast.ShowWithCast showWithCastInfo,
  ) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              showWithCastInfo.name,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            background: Image.network(
              showWithCastInfo.image.original,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ************************************************ Info *************************************************

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 9, 15, 0),
                  child: RichText(
                    text: TextSpan(
                        text: "State : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        children: [
                          TextSpan(
                              text: showWithCastInfo.status,
                              style: TextStyle(color: showWithCastInfo.status == "Ended" ? Colors.red :Colors.green))
                        ]),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 9, 15, 0),
                    child: RatingBar(
                      showRating: showWithCastInfo.rating.average,
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 24, 15, 0),
                  child: Text(
                    showWithCastInfo.summary,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
                  child: Text(
                    "CAST",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.white),
                  ),
                ),

                Container(
                    height: getPhoneHeight(context) / 2.1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: showWithCastInfo.embedded.cast.length,
                        itemBuilder: (context, index) {
                          var castList = showWithCastInfo.embedded.cast;
                          return CastCard(
                              actorImage: castList[index].person.image.original,
                              actorName: castList[index].person.name,
                              characterName: castList[index].character.name);
                        })),

                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
