import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsShimmerWidget extends StatelessWidget {
  const ProjectsShimmerWidget({
    Key key,
    @required this.dynHeight,
  }) : super(key: key);

  final double dynHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        itemBuilder: (context, i) => Container(
          width: double.infinity,
          height: dynHeight / 2,
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 5),
          decoration: BoxDecoration(
              border: Border(
            // bottom: BorderSide(
            //     color: Colors.white24, width: 3),
            top: BorderSide(color: Colors.white24, width: 3),
          )),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue[200],
              onTap: () {
                print("Data $i is clicked!");
              },
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          // BorderRadius.circular(30),
                          BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Image",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          flex: 8,
                          child: Container(
                            width: double.infinity,
                            height: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
