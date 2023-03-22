import 'package:flutter/material.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:stakanto/widget/game_screen.dart';

class KpopScreen extends StatefulWidget {
  const KpopScreen({Key? key}) : super(key: key);

  @override
  State<KpopScreen> createState() => _KpopScreenState();
}

class _KpopScreenState extends State<KpopScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: gameScreen(width: width, height: height),
    );
  }
}
