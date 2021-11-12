import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarsShimmerWidget extends StatelessWidget {
  const StarsShimmerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, i) => Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 20),
                  Spacer(),
                  SmoothStarRating(
                    rating: 5,
                    isReadOnly: true,
                    size: 25,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    color: Colors.grey[300],
                    borderColor: Colors.red[200],
                    allowHalfRating: true,
                    spacing: 2.0,
                  ),
                ],
              ),
            ));
  }
}
