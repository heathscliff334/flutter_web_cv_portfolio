import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class SosmedButtonWidget extends StatefulWidget {
  const SosmedButtonWidget(
      {Key? key,
      required this.url,
      required this.imgUrl,
      required this.itemIcon})
      : super(key: key);
  final String url;
  final String imgUrl;
  final Icon itemIcon;

  @override
  State<SosmedButtonWidget> createState() => _SosmedButtonWidgetState();
}

class _SosmedButtonWidgetState extends State<SosmedButtonWidget> {
  Color _buttonThemeColor = Colors.black26;
  void _onHover(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.black54;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.black26;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: Bounceable(
        onTap: () async {
          print("Pressed!");
          if (await canLaunch(widget.url)) {
            await launch(widget.url, forceSafariVC: false);
          } else {
            throw 'Could not launch ${widget.url}';
          }
        },
        child: Container(
          height: 35,
          width: 35,
          // padding: EdgeInsets.all(6),
          decoration:
              BoxDecoration(color: _buttonThemeColor, shape: BoxShape.circle),
          // child: Image(
          //   image: NetworkImage(imgUrl),
          //   // width: 50,
          //   // color: Colors.black,
          //   fit: BoxFit.cover,
          // ),
          child: widget.itemIcon,
        ),
      ),
    );
  }
}
