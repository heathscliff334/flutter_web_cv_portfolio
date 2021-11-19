import 'package:flutter/material.dart';

class ProjectsDetailsPage extends StatefulWidget {
  ProjectsDetailsPage({Key key}) : super(key: key);

  @override
  _ProjectsDetailsPageState createState() => _ProjectsDetailsPageState();
}

class _ProjectsDetailsPageState extends State<ProjectsDetailsPage> {
  bool isLandscape;
  double dynHeight, dynWidth;
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
                          ],
                        ),
                      ),
                      Expanded(
                          child: Center(
                        child: Text(
                          "Coming soon",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black45,
                                    blurRadius: 10,
                                    offset: Offset(0, 4))
                              ],
                              letterSpacing: 3,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ))
                    ],
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
