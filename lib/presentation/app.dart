import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/home/home_page.dart';
import 'package:flutter_web/presentation/projects/projects_details_page.dart';
import 'package:flutter_web/presentation/projects/projects_page.dart';

import 'package:flutter_web/presentation/skills/skills_page.dart';

class App extends StatefulWidget {
  // const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/skills": (context) => SkillsPage(),
        "/projects": (context) => ProjectsPage(),
        "/projects/detail": (context) => ProjectsDetailsPage(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/projects") {
      //     return PageRouteBuilder(
      //         settings:
      //             settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
      //         pageBuilder: (_, __, ___) => ProjectsPage(),
      //         transitionsBuilder: (_, a, __, c) =>
      //             FadeTransition(opacity: a, child: c));
      //   }
      //   // Unknown route
      //   return MaterialPageRoute(builder: (_) => ProjectsPage());
      // },

      // ignore: missing_return
      // onGenerateRoute: (settings) {

      // switch (settings.name) {
      //   case '/':
      //     print(pathComponents);
      //     return MaterialPageRoute(
      //       builder: (context) => HomePage(),
      //     );
      //     break;
      //   case '/skills':
      //     print(pathComponents);
      //     return MaterialPageRoute(
      //       builder: (context) => SkillsPage(),
      //     );
      //     break;
      //   case '/projects':
      //     print(pathComponents);
      //     return MaterialPageRoute(
      //       builder: (context) => ProjectsPage(),
      //     );
      //     break;
      //   case '/projects/detail':
      //     print(pathComponents);
      //     return MaterialPageRoute(
      //       builder: (context) => ProjectsDetailsPage(
      //           // arguments: pathComponents.last,
      //           ),
      //     );
      //     break;
      //   default:
      //     print(pathComponents);
      //     return MaterialPageRoute(
      //       // builder: (context) => HomePage(),
      //       builder: (context) => HomePage(
      //           // arguments: pathComponents.last,
      //           ),
      //     );
      // }
      // },
      debugShowCheckedModeBanner: false,
      title: "CV & Portfolio - Kevin Laurence",
      // home: Scaffold(
      //   body: HomePage(),
      // ),
    );
  }
}
