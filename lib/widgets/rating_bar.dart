import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../consts.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key key,
    @required this.showRating,
  }) : super(key: key);

  final double showRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothStarRating(
          isReadOnly: true,
          borderColor: showRating !=null ? ratingColor : Colors.black,
          color: showRating !=null ? ratingColor : Colors.black,
          allowHalfRating: true,
          rating: showRating != null ? showRating / 2 : 0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Text(
            showRating != null ? showRating.toString() : "N/A" ,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}