import 'package:flutter/material.dart';

class ItemDividerWidget extends StatelessWidget {
  const ItemDividerWidget({Key? key, required this.marginBtm})
      : super(key: key);
  final double marginBtm;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginBtm),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white24,
          border: Border(bottom: BorderSide(color: Colors.white24, width: 3))),
    );
  }
}
