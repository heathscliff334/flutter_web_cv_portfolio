import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class NavButtonWidget extends StatelessWidget {
  const NavButtonWidget(
      {Key key, @required this.btnTitle, @required this.navRoute})
      : super(key: key);
  final String btnTitle;
  final String navRoute;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Bounceable(
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
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black12,
            // gradient: LinearGradient(
            //   colors: [
            //     const Color(0xFFC300FF).withOpacity(0.5),
            //     const Color(0xFF3366FF).withOpacity(0.5),
            //   ],
            //   begin: const FractionalOffset(0.0, 0.0),
            //   end: const FractionalOffset(1.0, 0.0),
            //   stops: [0.0, 1.0],
            //   tileMode: TileMode.clamp,
            // ),
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
          // child: Icon(
          //   Icons.view_list_rounded,
          //   color: Colors.grey[200],
          // ),
        ),
      ),
    );
  }
}
