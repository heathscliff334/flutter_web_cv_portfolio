import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PortraitProjectsView extends StatelessWidget {
  const PortraitProjectsView({
    Key? key,
    required ScrollController scrollController,
    required this.myList,
    required this.dynHeight,
    required int currentMax,
  })  : _scrollController = scrollController,
        _currentMax = currentMax,
        super(key: key);

  final ScrollController _scrollController;
  final List myList;
  final double dynHeight;
  final int _currentMax;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiquidPullToRefresh(
        color: Colors.transparent,
        backgroundColor: Colors.blue[200],
        // animSpeedFactor: 1.0,
        springAnimationDurationInMilliseconds: 500,
        showChildOpacityTransition: false,
        onRefresh: () async {
          // setState(() {
          //   // _loadShimmer = true;
          //   // filter = "tanggal";
          //   // _sortType = "DESC";
          // });
          // // getTransaction();
        },
        child: ListView.builder(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          // itemExtent: 80,
          // +1 to show loading indicator

          itemBuilder: (context, i) {
            if (i == myList.length) {
              return CupertinoActivityIndicator();
            }
            return Container(
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
                              color: Colors.white,
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
                                child: Text(
                                  "Title Title Title Title Title Title Title",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _currentMax + 1,
        ),
      ),
    );
  }
}
