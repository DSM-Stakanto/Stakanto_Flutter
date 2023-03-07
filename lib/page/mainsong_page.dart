import 'package:flutter/material.dart';

class MainSongPage extends StatefulWidget {
  const MainSongPage({Key? key}) : super(key: key);

  @override
  State<MainSongPage> createState() => _MainSongPageState();
}

class _MainSongPageState extends State<MainSongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff7758D1), Color(0xffE000FF)]
              )
          ),
      ),
    );
  }
}
