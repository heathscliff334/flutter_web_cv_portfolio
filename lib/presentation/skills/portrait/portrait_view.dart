import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class PortraitView extends StatelessWidget {
  const PortraitView({
    Key? key,
    required skillList,
    required List<String> listLanguages,
    required this.dynWidth,
    required List<double> listStarsLanguages,
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
    return ListView.builder(
      padding: EdgeInsets.zero,
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
