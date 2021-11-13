import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/widgets/projects_shimmer_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class ListProjectsWidget extends StatelessWidget {
  const ListProjectsWidget({
    Key key,
    @required projectList,
    @required this.dynHeight,
    @required this.languageEn,
  })  : _projectList = projectList,
        super(key: key);

  final _projectList;
  final double dynHeight;
  final bool languageEn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (_projectList != null)
          ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _projectList.length + 1,
              itemBuilder: (context, i) {
                if (i == _projectList.length) {
                  return CupertinoActivityIndicator();
                }
                return Container(
                  width: double.infinity,
                  height: dynHeight / 2,
                  margin: EdgeInsets.only(bottom: 5),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 5),
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
                          Stack(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.white,
                                child: Container(
                                  width: double.infinity,
                                  // height: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        // BorderRadius.circular(30),
                                        BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                // height: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/id/1$i/200"),
                                    fit: BoxFit.cover,
                                  ),
                                  // color:
                                  //     Colors.green,
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
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    child: Text(
                                      "${_projectList[i].projectTitle}",
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
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Scrollbar(
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Text(
                                              "${_projectList[i].projectHeadline}",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      (languageEn == true)
                                          ? "${_projectList[i].projectDescriptionEn}"
                                          : "${_projectList[i].projectDescriptionId}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
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
              })
          : ProjectsShimmerWidget(dynHeight: dynHeight),
    );
  }
}
