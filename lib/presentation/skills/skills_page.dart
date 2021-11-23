import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/application/skills/cubit/skills_cubit.dart';

import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:flutter_web/presentation/widgets/list_stars_widget.dart';
import 'package:flutter_web/presentation/widgets/stars_shimmer_widget.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key key}) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  var _skillList, _languagesList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    print("ID : ${args['id']}");
    setState(() {
      // To detect the orientation of the screen (browser) to asign a dynamic height and width
      isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
      print("Landscape Status : $isLandscape");
      if (isLandscape == true) {
        dynHeight = MediaQuery.of(context).size.height / 1.3;
        dynWidth = MediaQuery.of(context).size.width / 1.7;
        // dynWidth = MediaQuery.of(context).size.width / 2.5;
      } else {
        dynHeight = MediaQuery.of(context).size.height / 1.1;
        dynWidth = MediaQuery.of(context).size.width / 1.1;
      }
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                  create: (context) => SkillsCubit(),
                  child: Container(
                    child: BlocConsumer<SkillsCubit, SkillsState>(
                        listener: (context, state) {
                      if (state is SkillsLoading) {
                        print("Loading..");
                      } else if (state is SkillsError) {
                        print("Skill error ${state.errorMessage}");
                      } else if (state is SkillsGetSuccess) {
                        print("Skill get success");
                        _skillList = state.getSkillsList.data.skills;
                        _languagesList = state.getSkillsList.data.languages;
                        // print(_skillList[0].skillName);
                        // for (var i = 0; i < _skillList.length; i++) {
                        //   print(
                        //       "${_skillList[i].skillName} : ${_skillList[i].skillStar}");
                        // }
                      }
                    }, builder: (context, state) {
                      if (state is SkillsInitial) {
                        context.read<SkillsCubit>().getSkills();
                      }
                      // if (state is SkillsGetSuccess) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
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
                                ],
                              ),
                            ),
                            ItemDividerWidget(marginBtm: 10),
                            Expanded(
                              child: CustomScrollView(
                                physics: BouncingScrollPhysics(),
                                slivers: [
                                  SliverList(
                                      delegate: SliverChildListDelegate([
                                    // Container(
                                    //   child: Row(
                                    //     children: [
                                    //       IconButton(
                                    //           onPressed: () {
                                    //             Navigator.pop(context);
                                    //           },
                                    //           icon: Icon(
                                    //             Icons.arrow_back,
                                    //             color: Colors.white,
                                    //           )),
                                    //       Spacer(),
                                    //     ],
                                    //   ),
                                    // ),
                                    // ItemDividerWidget(marginBtm: 10),
                                    Text(
                                      "Skills",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontFamily: 'Nasalization',
                                      ),
                                    ),
                                    ItemDividerWidget(marginBtm: 10),
                                    Container(
                                      // color: Colors.black,
                                      // width: 100,
                                      width: double.infinity,
                                      padding: (isLandscape == true)
                                          ? EdgeInsets.symmetric(
                                              horizontal: dynHeight / 4)
                                          : EdgeInsets.zero,

                                      height: dynHeight / 2.5,
                                      child: (_skillList != null)
                                          ? ListStarsWidget(
                                              listItem: _skillList,
                                              itemType: "skills")
                                          : Container(
                                              child: StarsShimmerWidget(),
                                            ),
                                    ),
                                    SizedBox(height: 15),
                                    ItemDividerWidget(marginBtm: 10),
                                    Text(
                                      "Languages",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontFamily: 'Nasalization',
                                      ),
                                    ),
                                    ItemDividerWidget(marginBtm: 10),
                                    Container(
                                        padding: (isLandscape == true)
                                            ? EdgeInsets.symmetric(
                                                horizontal: dynHeight / 4)
                                            : EdgeInsets.zero,
                                        width: double.infinity,
                                        height: dynHeight / 5,
                                        child: (_languagesList != null)
                                            ? ListStarsWidget(
                                                listItem: _languagesList,
                                                itemType: "languages")
                                            : Container(
                                                child: StarsShimmerWidget())),
                                  ]))
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
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
