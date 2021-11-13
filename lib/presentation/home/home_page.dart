import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_web/application/home/cubit/home_cubit.dart';
import 'package:flutter_web/presentation/projects/projects_page.dart';
import 'package:flutter_web/presentation/skills/skills_page.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLandscape;
  double dynHeight, dynWidth;
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
                        // String tempInterest = "";
                        // for (var k = 0; k < _interestsList.length; k++) {
                        //   print(
                        //       "Interests : ${_interestsList[k].interestName}");
                        //   if (_interestsList[k + 1].interestName != null) {
                        //     tempInterest =
                        //         "${tempInterest + _interestsList[k].interestName}, ";
                        //   } else {
                        //     tempInterest =
                        //         "${tempInterest + _interestsList[k].interestName}";
                        //   }
                        //   // tempInterest =
                        //   //     "${tempInterest + _interestsList[k].interestName}";
                        // }
                        // print("Temp interest : $tempInterest");
                      }
                    },
                    builder: (context, state) {
                      print("State status: $state");
                      if (state is HomeInitial) {
                        context.read<HomeCubit>().getHomes();
                      } else if (state is HomeLoading) {
                        return Container(
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                      } else if (state is HomeSuccess) {
                        return Container(
                          // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          padding: EdgeInsets.only(
                              top: 5, left: 25, right: 25, bottom: 0),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Bounceable(
                                onTap: () {},
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Color(0xFFC300FF),
                                        child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
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
                                            image: NetworkImage(
                                                "https://media-exp1.licdn.com/dms/image/C5103AQHjVhRuL3yXgw/profile-displayphoto-shrink_200_200/0/1544581409377?e=1640217600&v=beta&t=LdMRsw9u4qPU6oaf4iQloowmQXWDgta6VRtU0vqy5Po"),
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
                                              Bounceable(
                                                onTap: () {},
                                                child: Container(
                                                  // height: 10,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white54,
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                  SosmedButton(
                                    url: "https://github.com/heathscliff334",
                                    imgUrl:
                                        "https://image.flaticon.com/icons/png/512/25/25231.png",
                                  ),
                                  SizedBox(width: 10),
                                  SosmedButton(
                                    url:
                                        "https://www.linkedin.com/in/kevin-laurence-hartono-6a61bb113/",
                                    imgUrl:
                                        "https://image.flaticon.com/icons/png/512/174/174857.png",
                                  ),
                                  SizedBox(width: 10),
                                  SosmedButton(
                                    url: "https://www.instagram.com/vinz_lrn/",
                                    imgUrl:
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1024px-Instagram_icon.png",
                                  ),
                                  SizedBox(width: 10),
                                  SosmedButton(
                                    url: "https://github.com/heathscliff334",
                                    imgUrl:
                                        "https://cdn.pixabay.com/photo/2016/01/26/17/15/gmail-1162901_640.png",
                                  ),
                                ],
                              ),
                              ItemDividerWidget(marginBtm: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NavButton(
                                      btnTitle: "Projects",
                                      navRoute: "projects"),
                                  SizedBox(width: 10),
                                  NavButton(
                                      btnTitle: "Skills", navRoute: "skills"),
                                  // NavButton(btnTitle: "Projects", navRoute: ""),
                                ],
                              ),
                              // Spacer(),
                              SizedBox(height: 25),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                // color: Colors.red,
                                width: dynWidth,
                                height: 20,
                                child: Center(
                                    child: Text(
                                  "2021 \u00a9 Kevin Laurence. Powered by Flutter",
                                  style: TextStyle(color: Colors.white70),
                                )),
                              )
                            ],
                          ),
                        );
                      }
                      return Container();
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

class NavButton extends StatelessWidget {
  const NavButton({Key key, @required this.btnTitle, @required this.navRoute})
      : super(key: key);
  final String btnTitle;
  final String navRoute;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        switch (navRoute) {
          case "projects":
            // Navigator.push(
            //     context,
            //     PageTransition(
            //       type: PageTransitionType.fade,
            //       child: ProjectsPage(),
            //     ));

            Navigator.pushNamed(context, '/projects', arguments: {'id': 1});
            break;
          case "skills":
            // Navigator.push(
            //     context,
            //     PageTransition(
            //       type: PageTransitionType.fade,
            //       child: SkillsPage(),
            //     ));

            Navigator.pushNamed(context, '/skills', arguments: {'id': 1});
            break;
          default:
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Page doesn't exist!"),
                    ));
            break;
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white.withOpacity(0.5),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFC300FF).withOpacity(0.5),
              const Color(0xFF3366FF).withOpacity(0.5),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 4))
          ],
        ),
        child: Text(
          btnTitle,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class SosmedButton extends StatelessWidget {
  const SosmedButton({Key key, @required this.url, @required this.imgUrl})
      : super(key: key);
  final String url;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Bounceable(
        onTap: () async {
          print("Pressed!");
          if (await canLaunch(url)) {
            await launch(url, forceSafariVC: false);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100)),
          child: Image(
            image: NetworkImage(imgUrl),
            // width: 50,
            // color: Colors.black,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
