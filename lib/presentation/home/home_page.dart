import 'dart:math';

import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_web/application/home/cubit/home_cubit.dart';
import 'package:flutter_web/presentation/home/test_page.dart';
import 'package:flutter_web/presentation/projects/projects_page.dart';
import 'package:flutter_web/presentation/skills/skills_page.dart';
import 'package:flutter_web/presentation/widgets/home_shimmer_widget.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:flutter_web/presentation/widgets/nav_button_widget.dart';
import 'package:flutter_web/presentation/widgets/sosmed_button_widget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLandscape = false;
  double dynHeight = 0, dynWidth = 0;
  var _homeList, _interestsList;

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
        // color: Colors.blue,
        child: Center(
          child: Container(
            height: dynHeight,
            width: dynWidth,
            child: Stack(
              children: [
                // Background color
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
                  create: (context) => HomeCubit(),
                  child: BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      if (state is HomeLoading) {
                        print("loading...");
                      } else if (state is HomeError) {
                        print("Error");
                      } else if (state is HomeSuccess) {
                        print("success");
                        _homeList = state.getHomeList.data;
                        _interestsList = _homeList[0].interests;
                      }
                    },
                    builder: (context, state) {
                      print("State status: $state");
                      if (state is HomeInitial) {
                        context.read<HomeCubit>().getHomes();
                      } else if (state is HomeLoading) {
                        // return Container(
                        //   child: Center(
                        //     child: CupertinoActivityIndicator(),
                        //   ),
                        // );
                        return HomeShimmerWidget(
                            isLandscape: isLandscape,
                            dynHeight: dynHeight,
                            dynWidth: dynWidth);
                      } else if (state is HomeSuccess) {
                        return Container(
                          // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          padding: EdgeInsets.only(
                              top: 5, left: 25, right: 25, bottom: 0),
                          child: CustomScrollView(
                            slivers: [
                              SliverList(
                                  delegate: SliverChildListDelegate([
                                SizedBox(height: 15),
                                Bounceable(
                                  onTap: () {},
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.white,
                                          highlightColor: Color(0xFFC300FF),
                                          // highlightColor: Color(0xFF252E28),
                                          child: Container(
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 110,
                                          height: 110,
                                          padding: EdgeInsets.all(3),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            // child: Container(
                                            //     color: Colors.black54,
                                            //     child: Center(
                                            //       child: Text(
                                            //         "Profile Picture",
                                            //         style: TextStyle(
                                            //             color: Colors.white,
                                            //             fontWeight:
                                            //                 FontWeight.w500),
                                            //       ),
                                            //     )),
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/profile-picture.jpeg"),
                                              fit: BoxFit.cover,
                                              key: ValueKey(
                                                  new Random().nextInt(100)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                    "${_homeList[0].fullname}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontFamily: 'Nasalization',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "${_homeList[0].headline}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 5),
                                ItemDividerWidget(marginBtm: 10),
                                Container(
                                  // height: MediaQuery.of(context).size.height / 9,
                                  height: (isLandscape == true)
                                      ? dynHeight / 8
                                      : dynHeight / 4.5,
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "${_homeList[0].description}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                ItemDividerWidget(marginBtm: 10),
                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: (isLandscape == true)
                                        ? MainAxisAlignment.center
                                        : MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Interests:",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Flexible(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _interestsList.length,
                                            itemBuilder: (context, i) => Row(
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.grab,
                                                  child: Bounceable(
                                                    onTap: () {},
                                                    child: Container(
                                                      // height: 10,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white54,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Text(
                                                        "${_interestsList[i].interestName}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ItemDividerWidget(marginBtm: 10),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SosmedButtonWidget(
                                      url: "https://github.com/heathscliff334",
                                      imgUrl:
                                          "https://image.flaticon.com/icons/png/512/25/25231.png",
                                      itemIcon: Icon(
                                        LineIcons.github,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SosmedButtonWidget(
                                      url:
                                          "https://www.linkedin.com/in/kevin-laurence-6a61bb113/",
                                      imgUrl:
                                          "https://image.flaticon.com/icons/png/512/174/174857.png",
                                      itemIcon: Icon(
                                        LineIcons.linkedin,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SosmedButtonWidget(
                                      url:
                                          "https://www.instagram.com/vinz_lrn/",
                                      imgUrl:
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png",
                                      itemIcon: Icon(
                                        LineIcons.instagram,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SosmedButtonWidget(
                                      url: "mailto:kevin@laurenscodes.space",
                                      imgUrl:
                                          "https://cdn.pixabay.com/photo/2016/01/26/17/15/gmail-1162901_640.png",
                                      itemIcon: Icon(
                                        Icons.mail_outline_rounded,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                ItemDividerWidget(marginBtm: 15),

                                // MaterialButton(
                                //     onPressed: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   TestPage()));
                                //     },
                                //     color: Colors.black54,
                                //     child: Text(
                                //       "TEST",
                                //       style: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //     )),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NavButtonWidget(
                                      btnTitle: "Projects",
                                      navRoute: "projects",
                                    ),
                                    SizedBox(width: 10),
                                    NavButtonWidget(
                                        btnTitle: "Skills", navRoute: "skills"),
                                    // NavButtonWidget(btnTitle: "Projects", navRoute: ""),
                                  ],
                                ),
                                // Spacer(),
                                SizedBox(height: 25),
                              ])),
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  // color: Colors.red,
                                  width: dynWidth,
                                  // height: 20,
                                  // child: Center(
                                  //     child: Text(
                                  //   "2021 \u00a9 Kevin Laurence. Powered by Flutter.",
                                  //   style: TextStyle(color: Colors.white70),
                                  // )),
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "2021 \u00a9 Kevin Laurence. Powered by Flutter Wasm.",
                                        style: TextStyle(color: Colors.white70),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return HomeShimmerWidget(
                          isLandscape: isLandscape,
                          dynHeight: dynHeight,
                          dynWidth: dynWidth);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
