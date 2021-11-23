import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsDetailsPage extends StatefulWidget {
  ProjectsDetailsPage({Key key}) : super(key: key);

  // ProjectsDetailsPage({Key key, @required this.arguments}) : super(key: key);
  // final arguments;

  @override
  _ProjectsDetailsPageState createState() => _ProjectsDetailsPageState();
}

class _ProjectsDetailsPageState extends State<ProjectsDetailsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
  bool languageEn = true;
  Map _projectDetails;
  // String testUri = Uri.base.queryParameters[0];
  Color _buttonThemeColor = Colors.white;
  void _onHover(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.grey[300];
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.white;
    });
  }

  final _imagesList = <Widget>[
    InkWell(
      onTap: () {
        print('tapped');
      },
      child:
          Image.network("https://picsum.photos/id/450/200", fit: BoxFit.cover),
    ),
    InkWell(
      onTap: () {
        print('tapped');
      },
      child:
          Image.network("https://picsum.photos/id/22/200", fit: BoxFit.cover),
    ),
    InkWell(
      onTap: () {
        print('tapped');
      },
      child:
          Image.network("https://picsum.photos/id/23/200", fit: BoxFit.cover),
    ),
    InkWell(
      onTap: () {
        print('tapped');
      },
      child:
          Image.network("https://picsum.photos/id/27/200", fit: BoxFit.cover),
    ),
  ];
  void _getArguments() {
    final args = ModalRoute.of(context).settings.arguments as Map;
    _projectDetails = args;
    print("Arguments: ${_projectDetails['detail']}");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.arguments);
    // print("test uri: ${Uri.base.queryParameters}");
    _getArguments();
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
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
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
                                          decoration: (languageEn == false)
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
                        ItemDividerWidget(marginBtm: 10),
                        Expanded(
                          child: CustomScrollView(
                            physics: BouncingScrollPhysics(),
                            slivers: [
                              SliverList(
                                  delegate: SliverChildListDelegate([
                                Container(
                                  width: double.infinity,
                                  height: dynHeight / 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ImageSlideshow(
                                    width: double.infinity,
                                    initialPage: 0,
                                    indicatorColor: Colors.blue,
                                    indicatorBackgroundColor: Colors.grey,
                                    onPageChanged: (value) {
                                      print('Page changed: $value');
                                    },
                                    autoPlayInterval: 3000,
                                    isLoop: true,
                                    children: _imagesList,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  alignment: Alignment.centerLeft,

                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Text(
                                    "${_projectDetails['detail'].projectTitle}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  alignment: Alignment.centerLeft,

                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Text(
                                    "${_projectDetails['detail'].projectHeadline}",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 5),
                                ItemDividerWidget(marginBtm: 10),
                                Container(
                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Text(
                                    (languageEn == true)
                                        ? "${_projectDetails['detail'].projectDescriptionEn}"
                                        : "${_projectDetails['detail'].projectDescriptionId}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Project Link: ',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      MouseRegion(
                                        onHover: _onHover,
                                        onExit: _onExit,
                                        cursor: SystemMouseCursors.click,
                                        child: Bounceable(
                                            onTap: () async {
                                              if (await canLaunch(
                                                  _projectDetails['detail']
                                                      .projectLink)) {
                                                await launch(
                                                    _projectDetails['detail']
                                                        .projectLink,
                                                    forceSafariVC: false);
                                              } else {
                                                throw 'Could not launch ${_projectDetails['detail'].projectLink}';
                                              }
                                            },
                                            child: Text(
                                              'Click here.',
                                              style: TextStyle(
                                                  color: _buttonThemeColor,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ]))
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
