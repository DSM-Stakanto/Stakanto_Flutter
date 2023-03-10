import 'package:flutter/material.dart';
import 'package:stakanto/game/kpop.dart';

class MainSongPage extends StatefulWidget {
  const MainSongPage({Key? key}) : super(key: key);

  @override
  State<MainSongPage> createState() => _MainSongPageState();
}

class _MainSongPageState extends State<MainSongPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff7758D1), Color(0xffE000FF)])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KpopScreen()));
                      },
                      child: Image_widget(width, 'assets/images/kpop.png')),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Jpop',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Image_widget(width, 'assets/images/pop.png'),
            ],
          ),
        ),
      ),
    );
  }

  Padding Image_widget(double width, String asset) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Image.asset(asset),
    );
  }
}
