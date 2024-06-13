import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsLandscapeShimmerWidget extends StatelessWidget {
  const ProjectsLandscapeShimmerWidget({
    Key? key,
    required this.dynHeight,
  }) : super(key: key);

  final double dynHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, i) {
          return Container(
            width: double.infinity,
            height: dynHeight / 3.3,
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.white24, width: 3),
              top: BorderSide(color: Colors.white24, width: 3),
            )),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            // BorderRadius.circular(30),
                            BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 22,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  height: 16,
                                  color: Colors.grey[300],
                                )),
                            SizedBox(height: 5),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
