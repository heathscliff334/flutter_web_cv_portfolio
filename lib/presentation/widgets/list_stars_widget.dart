import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ListStarsWidget extends StatelessWidget {
  const ListStarsWidget({
    Key? key,
    required listItem,
    required itemType,
  })  : _listItem = listItem,
        _itemType = itemType,
        super(key: key);

  final _listItem;
  final String _itemType;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _listItem.length,
        itemBuilder: (context, i) => Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (_itemType == 'skills')
                    ? "${_listItem[i].skillName}"
                    : "${_listItem[i].languageName}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              SmoothStarRating(
                rating: (_itemType == 'skills')
                    ? double.parse(_listItem[i].skillStar)
                    : double.parse(_listItem[i].languageStar),
                // isReadOnly: true,
                size: 25,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                color: Colors.yellow,
                borderColor: Colors.red[200],
                allowHalfRating: true,
                spacing: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
