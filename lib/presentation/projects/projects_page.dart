import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_web/application/projects/cubit/projects_cubit.dart';
import 'package:flutter_web/presentation/projects/landscape/landscape_projects_view.dart';
import 'package:flutter_web/presentation/projects/portrait/portrait_projects_view.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:flutter_web/presentation/widgets/list_projects_landscape_widget.dart';
import 'package:flutter_web/presentation/widgets/list_projects_portrait_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  List myList;
  var _projectList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  bool languageEn = true;
  Timer _timer;

  void popUpTimer(_startTime) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (_startTime == 0) {
        // refreshWithTimer(30, true);
        onProgress();
      } else {
        // setState(() {
        _startTime--;
        print("Timer $_startTime");
        // setState(() {});
      }
    });
  }

  void onProgress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text("Warning"),
              content: new Text("Development is in progress!"),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    _timer.cancel();
    // setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    myList = List.generate(10, (i) => "item : ${i + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    popUpTimer(2);
    super.initState();
  }

  _getMoreData() {
    print("Load more data");
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      myList.add("item : ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // To detect the orientation of the screen (browser) to asign a dynamic height and width
      isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
      print("Landscape Status : $isLandscape");
      if (isLandscape == true) {
        dynHeight = MediaQuery.of(context).size.height / 1.3;
        dynWidth = MediaQuery.of(context).size.width / 1.7;
      } else {
        dynHeight = MediaQuery.of(context).size.height / 1.1;
        dynWidth = MediaQuery.of(context).size.width / 1.1;
      }
    });
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            height: dynHeight,
            width: dynWidth,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFFC300FF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => ProjectsCubit(),
                  child: BlocConsumer<ProjectsCubit, ProjectsState>(
                    listener: (context, state) {
                      if (state is ProjectsLoading) {
                        print("Loading..");
                      } else if (state is ProjectsError) {
                        print("Error");
                        print("${state.errorMessage}");
                      } else if (state is ProjectsGetSuccess) {
                        print("Success");
                        _projectList = state.getProjectsList.data;
                      }
                    },
                    builder: (context, state) {
                      if (state is ProjectsInitial) {
                        context.read<ProjectsCubit>().getProjects();
                      }
                      return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        )),
                                    Spacer(),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Bounceable(
                                        onTap: () {
                                          // _onProgress();
                                          print("ID tapped!");
                                          languageEn = false;
                                          setState(() {});
                                        },
                                        child: Text("ID",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                decoration: (languageEn ==
                                                        false)
                                                    ? TextDecoration.overline
                                                    : TextDecoration.none)),
                                      ),
                                    ),
                                    Text(" | ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 26)),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Bounceable(
                                        onTap: () {
                                          print("EN tapped!");
                                          languageEn = true;
                                          setState(() {});
                                        },
                                        child: Text("EN",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                decoration: (languageEn == true)
                                                    ? TextDecoration.overline
                                                    : TextDecoration.none)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              ItemDividerWidget(marginBtm: 10),
                              (isLandscape == true)
                                  ?
                                  // For browser landscape
                                  ListProjectsLandscapeWidget(
                                      scrollController: _scrollController,
                                      projectList: _projectList,
                                      dynHeight: dynHeight,
                                      languageEn: languageEn)
                                  :
                                  // For Phone Screen
                                  ListProjectsPortraitWidget(
                                      scrollController: _scrollController,
                                      projectList: _projectList,
                                      dynHeight: dynHeight,
                                      languageEn: languageEn),
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
