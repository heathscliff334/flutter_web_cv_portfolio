import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PortraitView extends StatelessWidget {
  const PortraitView({
    Key key,
    @required skillList,
    @required List<String> listLanguages,
    @required this.dynWidth,
    @required List<double> listStarsLanguages,
  })  : _skillList = skillList,
        _listLanguages = listLanguages,
        _listStarsLanguages = listStarsLanguages,
        super(key: key);

  final _skillList;
  final List<String> _listLanguages;
  final double dynWidth;
  final List<double> _listStarsLanguages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 250,
      // width: double.infinity,
      child: Column(
        children: [
          Text(
            "Skills",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Nasalization',
            ),
          ),
          ItemDividerWidget(marginBtm: 10),
          ListView.builder(
            itemCount: _skillList.length,
            itemBuilder: (context, i) => Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${_skillList[i].skillName}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Spacer(),
                  SmoothStarRating(
                    rating: double.parse(_skillList[i].skillStar),
                    isReadOnly: true,
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
          SizedBox(height: 15),
          Text(
            "Languages",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Nasalization',
            ),
          ),
          ItemDividerWidget(marginBtm: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _listLanguages.length,
            itemBuilder: (context, i) => Container(
              width: dynWidth / 3,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      "${_listLanguages[i]}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    SmoothStarRating(
                      rating: _listStarsLanguages[i],
                      isReadOnly: true,
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
          ),
        ],
      ),
    );
  }
}
