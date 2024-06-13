import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_web/presentation/projects/projects_page.dart';
import 'package:flutter_web/presentation/widgets/projects_landscape_shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class ListProjectsLandscapeWidget extends StatelessWidget {
  const ListProjectsLandscapeWidget({
    Key? key,
    required ScrollController scrollController,
    required projectList,
    required this.dynHeight,
    required this.languageEn,
  })  : _scrollController = scrollController,
        _projectList = projectList,
        super(key: key);

  final _projectList;
  final ScrollController _scrollController;
  final double dynHeight;
  final bool languageEn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (_projectList != null)
          ? ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              // itemCount: _projectList.length + 1,
              itemCount: _projectList.length,
              itemBuilder: (context, i) {
                // if (i == _projectList.length) {
                //   return CupertinoActivityIndicator();
                // }
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
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
                      child: Bounceable(
                        onTap: () {
                          Navigator.pushNamed(context, '/projects/detail',
                              arguments: {'detail': _projectList[i]});
                          // Navigator.pushNamed(
                          //   context,
                          //   '/projects/detail/${_projectList[i].idProject}',
                          // );
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 200,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                // color: Colors.green,
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
                                // child: Image.network(
                                //   // "https://picsum.photos/id/1$i/200",
                                //   "https://www.poltektranssdp-palembang.ac.id/uploads/no-image.jpg",
                                //   fit: BoxFit.cover,
                                // ),
                                child: Image.asset(
                                  // "https://picsum.photos/id/1$i/200",
                                  "assets/images/no-image.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          // width: ,
                                          width: double.infinity,
                                          child: Text(
                                            "${_projectList[i].projectTitle}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                            style:
                                                TextStyle(color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5),
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
                  ),
                );
              },
            )
          : ProjectsLandscapeShimmerWidget(dynHeight: dynHeight),
    );
  }
}
