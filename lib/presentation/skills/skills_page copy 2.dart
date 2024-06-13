// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_web/application/skills/cubit/skills_cubit.dart';
// import 'package:flutter_web/presentation/skills/landscape/landscape_view.dart';
// import 'package:flutter_web/presentation/skills/portrait/portrait_view.dart';
// import 'package:flutter_web/presentation/widgets/item_divider_widget.dart';

// class SkillsPage extends StatefulWidget {
//   // const SkillsPage({ Key? key }) : super(key: key);

//   @override
//   _SkillsPageState createState() => _SkillsPageState();
// }

// class _SkillsPageState extends State<SkillsPage> {
//   bool isLandscape;
//   double dynHeight, dynWidth;
//   var _skillList;
//   List<String> _listLanguages = [
//     "Indonesia",
//     "English",
//     "Japanese",
//   ];
//   List<double> _listStarsLanguages = [5, 3, 2.5];
//   List<String> _listSkills = [
//     "Flutter",
//     "Java",
//     "PHP",
//     "CodeIgniter",
//     "HTML",
//     "CSS",
//     "Javascript",
//   ];
//   List<String> _listSkills2 = [
//     "Python",
//     "SQL Server",
//     "MySQL",
//     "Linux",
//     "Back-End",
//     "Mobile Dev",
//     "REST API"
//   ];
//   List<double> _listStars = [3.5, 3, 4, 3.5, 4, 4, 4.5];
//   List<double> _listStars2 = [2, 4, 4, 3, 3, 3.5, 3.5];
//   List<String> _tempSkills = [];
//   List<double> _tempStarts = [];
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     setState(() {
//       _tempSkills = _listSkills + _listSkills2;
//       _tempStarts = _listStars + _listStars2;
//       // To detect the orientation of the screen (browser) to asign a dynamic height and width
//       isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
//       print("Landscape Status : $isLandscape");
//       if (isLandscape == true) {
//         dynHeight = MediaQuery.of(context).size.height / 1.3;
//         dynWidth = MediaQuery.of(context).size.width / 1.7;
//       } else {
//         dynHeight = MediaQuery.of(context).size.height / 1.1;
//         dynWidth = MediaQuery.of(context).size.width / 1.1;
//       }
//     });
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Center(
//           child: Container(
//             height: dynHeight,
//             width: dynWidth,
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       colors: [
//                         const Color(0xFF3366FF),
//                         const Color(0xFFC300FF),
//                       ],
//                       begin: const FractionalOffset(0.0, 0.0),
//                       end: const FractionalOffset(1.0, 0.0),
//                       stops: [0.0, 1.0],
//                       tileMode: TileMode.clamp,
//                     ),
//                   ),
//                 ),
//                 BlocProvider(
//                   create: (context) => SkillsCubit(),
//                   child: SingleChildScrollView(
//                     child: BlocConsumer<SkillsCubit, SkillsState>(
//                         listener: (context, state) {
//                       if (state is SkillsLoading) {
//                         print("Loading..");
//                       } else if (state is SkillsError) {
//                         print("Skill error ${state.errorMessage}");
//                       } else if (state is SkillsGetSuccess) {
//                         print("Skill get success");
//                         _skillList = state.getSkillsList.data;
//                         // print(_skillList[0].skillName);
//                         // for (var i = 0; i < _skillList.length; i++) {
//                         //   print(
//                         //       "${_skillList[i].skillName} : ${_skillList[i].skillStar}");
//                         // }
//                       }
//                     }, builder: (context, state) {
//                       if (state is SkillsInitial) {
//                         context.read<SkillsCubit>().getSkills();
//                       }
//                       // if (state is SkillsGetSuccess) {
//                       return Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                         child: CustomScrollView(slivers: [
//                           SliverList(
//                             delegate: SliverChildListDelegate([
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         icon: Icon(
//                                           Icons.arrow_back,
//                                           color: Colors.white,
//                                         )),
//                                     Spacer(),
//                                   ],
//                                 ),
//                               ),
//                               ItemDividerWidget(marginBtm: 10),
//                               (state is SkillsGetSuccess)
//                                   ? (isLandscape == true)
//                                       ? LandscapeView(
//                                           listSkills: _listSkills,
//                                           listStars: _listStars,
//                                           listSkills2: _listSkills2,
//                                           listStars2: _listStars2,
//                                           listLanguages: _listLanguages,
//                                           dynWidth: dynWidth,
//                                           listStarsLanguages:
//                                               _listStarsLanguages)
//                                       : PortraitView(
//                                           skillList: _skillList,
//                                           listLanguages: _listLanguages,
//                                           dynWidth: dynWidth,
//                                           listStarsLanguages:
//                                               _listStarsLanguages)
//                                   : Container(),
//                             ]),
//                           ),
//                         ]),
//                       );
//                     }
//                         // else if (state is SkillsLoading) {
//                         //   return Container(
//                         //     child: Center(
//                         //       child: CupertinoActivityIndicator(),
//                         //     ),
//                         //   );
//                         // }
//                         // return Container(
//                         //   width: MediaQuery.of(context).size.width,
//                         //   height: MediaQuery.of(context).size.height,
//                         //   child: Center(
//                         //     child: CircularProgressIndicator(),
//                         //   ),
//                         // );
//                         // },
//                         ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
