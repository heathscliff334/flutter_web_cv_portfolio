import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class LandscapeView extends StatelessWidget {
  const LandscapeView({
    Key key,
    @required List<String> listSkills,
    @required List<double> listStars,
    @required List<String> listSkills2,
    @required List<double> listStars2,
    @required List<String> listLanguages,
    @required this.dynWidth,
    @required List<double> listStarsLanguages,
  })  : _listSkills = listSkills,
        _listStars = listStars,
        _listSkills2 = listSkills2,
        _listStars2 = listStars2,
        _listLanguages = listLanguages,
        _listStarsLanguages = listStarsLanguages,
        super(key: key);

  final List<String> _listSkills;
  final List<double> _listStars;
  final List<String> _listSkills2;
  final List<double> _listStars2;
  final List<String> _listLanguages;
  final double dynWidth;
  final List<double> _listStarsLanguages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Row(
          children: [
            Expanded(
              // width: (isLandscape == true) ? dynWidth / 2 : dynWidth,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _listSkills.length,
                itemBuilder: (context, i) => Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${_listSkills[i]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Spacer(),
                      SmoothStarRating(
                        rating: _listStars[i],
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
                        // onRated: (value) {
                        //   print("rating value -> ");
                        //   // print("rating value dd -> ${value.truncate()}");
                        // },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 150),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _listSkills2.length,
                itemBuilder: (context, i) => Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${_listSkills2[i]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Spacer(),
                      SmoothStarRating(
                        rating: _listStars2[i],
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
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
        Container(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
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
                      SizedBox(width: 10),
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
            )),
      ],
    );
  }
}
