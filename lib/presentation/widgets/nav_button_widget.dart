import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class NavButtonWidget extends StatefulWidget {
  const NavButtonWidget(
      {Key? key, required this.btnTitle, required this.navRoute})
      : super(key: key);
  final String btnTitle;
  final String navRoute;

  @override
  State<NavButtonWidget> createState() => _NavButtonWidgetState();
}

class _NavButtonWidgetState extends State<NavButtonWidget> {
  Color _buttonThemeColor = Colors.black54;
  Color _buttonTextColor = Colors.white;
  void _onHover(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.black;
      _buttonTextColor = Colors.white;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _buttonThemeColor = Colors.black54;
      _buttonTextColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: Bounceable(
        onTap: () {
          switch (widget.navRoute) {
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
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _buttonThemeColor,
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
              widget.btnTitle,
              style: TextStyle(
                  color: _buttonTextColor, fontWeight: FontWeight.w800),
            ),
            // child: Icon(
            //   Icons.view_list_rounded,
            //   color: Colors.grey[200],
            // ),
          ),
        ),
      ),
    );
  }
}
