import 'package:flutter/material.dart';
import 'package:series_app/consts.dart';
import 'package:series_app/functions.dart';
import 'package:series_app/widgets/rating_bar.dart';

class SeriesCard extends StatelessWidget {
  String state;
  String imgSrc;
  String name;
  double showRating;
  Function cardOnTap;

  SeriesCard({
    @required this.state,
    @required this.imgSrc,
    @required this.name,
    @required this.showRating,
    @required this.cardOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: seriesCardColor,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      child: InkWell(
         splashColor: Colors.teal,
      onTap: cardOnTap,
        child: Container(
          padding: EdgeInsets.all(9),
          height: getPhoneHeight(context) / 4.2,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Image.network(
                      imgSrc,
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(width: 9),
              Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: "State : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              children: [
                                TextSpan(
                                    text: state,
                                    style: TextStyle(color: state == "Ended" ? Colors.red : Colors.green))
                              ]),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: RatingBar(showRating: showRating)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


