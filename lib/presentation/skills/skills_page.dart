import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/application/skills/cubit/skills_cubit.dart';

import 'package:flutter_web/presentation/skills/portrait/portrait_view.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:flutter_web/presentation/widgets/list_stars_widget.dart';
import 'package:flutter_web/presentation/widgets/stars_shimmer_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SkillsPage extends StatefulWidget {
  // const SkillsPage({ Key? key }) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  var _skillList, _languagesList;
  List<String> _listLanguages = [
    "Indonesia",
    "English",
    "Japanese",
  ];
  List<double> _listStarsLanguages = [5, 3, 2.5];

  @override
  void initState() {
    super.initState();
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
                        child: LiquidPullToRefresh(
                          color: Colors.transparent,
                          backgroundColor: Colors.white60,
                          springAnimationDurationInMilliseconds: 500,
                          showChildOpacityTransition: false,
                          onRefresh: () async {
                            context.read<SkillsCubit>().getSkills();
                          },
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                  delegate: SliverChildListDelegate([
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
                                  width: double.infinity,
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
                                    width: double.infinity,
                                    height: dynHeight / 4.5,
                                    child: (_languagesList != null)
                                        ? ListStarsWidget(
                                            listItem: _languagesList,
                                            itemType: "languages")
                                        : Container(
                                            child: StarsShimmerWidget())),
                                // (state is SkillsGetSuccess)
                                //     ? (isLandscape == true)
                                //         ? LandscapeView(
                                //             listSkills: _listSkills,
                                //             listStars: _listStars,
                                //             listSkills2: _listSkills2,
                                //             listStars2: _listStars2,
                                //             listLanguages: _listLanguages,
                                //             dynWidth: dynWidth,
                                //             listStarsLanguages:
                                //                 _listStarsLanguages)
                                //         : PortraitView(
                                //             skillList: _skillList,
                                //             listLanguages: _listLanguages,
                                //             dynWidth: dynWidth,
                                //             listStarsLanguages:
                                //                 _listStarsLanguages)
                                //     : Container(),
                              ]))
                            ],
                          ),
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
