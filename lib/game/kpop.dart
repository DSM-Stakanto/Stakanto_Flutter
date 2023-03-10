import 'package:flutter/material.dart';
import 'package:siri_wave/siri_wave.dart';

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
      body: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xff7758D1), Color(0xffE000FF)])),
        child: Center(
          child: Stack(
            children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.1,
                        right: width * 0.1,
                    ),
                    child: SiriWave(
                      style: SiriWaveStyle.ios_9 ,
                      options: SiriWaveOptions(
                        height: height * 0.5,
                        width: width * 0.9
                      ),
                    ),
                  ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                  top: height * 0.4,
                  bottom: height * 0.5
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children :
                    [

                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
