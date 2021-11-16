import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class SosmedButtonWidget extends StatelessWidget {
  const SosmedButtonWidget(
      {Key key, @required this.url, @required this.imgUrl, this.itemIcon})
      : super(key: key);
  final String url;
  final String imgUrl;
  final Icon itemIcon;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Bounceable(
        onTap: () async {
          print("Pressed!");
          if (await canLaunch(url)) {
            await launch(url, forceSafariVC: false);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          height: 35,
          width: 35,
          // padding: EdgeInsets.all(6),
          decoration:
              BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
          // child: Image(
          //   image: NetworkImage(imgUrl),
          //   // width: 50,
          //   // color: Colors.black,
          //   fit: BoxFit.cover,
          // ),
          child: itemIcon,
        ),
      ),
    );
  }
}
