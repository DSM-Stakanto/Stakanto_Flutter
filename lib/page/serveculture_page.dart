import 'package:flutter/material.dart';

class ServeCulturePage extends StatefulWidget {
  const ServeCulturePage({Key? key}) : super(key: key);

  @override
  State<ServeCulturePage> createState() => _ServeCulturePageState();
}

class _ServeCulturePageState extends State<ServeCulturePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7758D1), Color(0xffE000FF)]
            )
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image_widget(width, 'assets/images/jpop.png'),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Jpop', style: TextStyle(
                            color: Colors.white,
                    )
                  ),
                      ],
                    ),)
                ],
              ),
              
              Image_widget(width, 'assets/images/game.png'),
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
