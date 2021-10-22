import 'package:flutter/material.dart';
import 'package:series_app/consts.dart';

import '../functions.dart';

class CastCard extends StatelessWidget {
  String actorImage;
  String actorName;
  String characterName;

  CastCard({
    @required this.actorImage,
    @required this.actorName,
    @required this.characterName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: getPhoneWidth(context)/2.1,
      color: seriesCardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6,child: Container(width: double.infinity,child: Image.network( actorImage,fit: BoxFit.cover,),)),
          Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 9),
            child: Text(actorName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          )),
          Expanded(flex: 1, child: Padding(
            padding: const EdgeInsets.only(left: 9),

            child: Text(characterName,style: TextStyle(color: characterNameColor,fontWeight: FontWeight.bold,fontSize: 15),),
          )),
        ],
      ),
    );
  }
}