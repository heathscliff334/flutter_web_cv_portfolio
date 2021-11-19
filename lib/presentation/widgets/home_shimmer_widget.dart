import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({
    Key key,
    @required this.isLandscape,
    @required this.dynHeight,
    @required this.dynWidth,
  }) : super(key: key);

  final bool isLandscape;
  final double dynHeight;
  final double dynWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white70,
      highlightColor: Colors.grey,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        padding: EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(height: 15),
              Bounceable(
                onTap: () {},
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    padding: EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: 100,
                  height: 24,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))),
              SizedBox(height: 5),
              Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))),
              SizedBox(height: 5),
              ItemDividerWidget(marginBtm: 10),
              Container(
                // height: MediaQuery.of(context).size.height / 9,
                height: (isLandscape == true) ? dynHeight / 8 : dynHeight / 4.5,
                child: Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10))),
              ),
              ItemDividerWidget(marginBtm: 10),
              Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10))),
              ItemDividerWidget(marginBtm: 10),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              ItemDividerWidget(marginBtm: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15))),
                  SizedBox(width: 10),
                  Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15))),
                ],
              ),
              // Spacer(),
              SizedBox(height: 65),
            ])),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                // color: Colors.red,
                width: dynWidth,
                height: 20,
                child: Center(
                    child: Text(
                  "2021 \u00a9 Kevin Laurence. Powered by Flutter.",
                  style: TextStyle(color: Colors.white70),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
