import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.black54,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "test",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              RadialMenu(
                // centerButtonSize: 0.5,
                children: [
                  RadialButton(
                      icon: Icon(Icons.ac_unit),
                      buttonColor: Colors.teal,
                      onPress: () {}),
                  RadialButton(
                      icon: Icon(Icons.camera_alt),
                      buttonColor: Colors.green,
                      onPress: () {}),
                  RadialButton(
                      icon: Icon(Icons.map),
                      buttonColor: Colors.orange,
                      onPress: () {}),

                  /* you can add any number of buttons, although it's 
                  not recommended to insert beyond 8-9 buttons. */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
