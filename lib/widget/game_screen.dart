import 'package:flutter/material.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:stakanto/test_screen.dart';
import 'package:stakanto/widget/pulse.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          gradient:
          RadialGradient(colors: [Colors.black, Color(0xff31295F)])),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: widget.width * 0.1,
                  right: widget.width * 0.1,
                ),
                child: SiriWave(
                  style: SiriWaveStyle.ios_9 ,
                  options: SiriWaveOptions(
                      height: widget.height * 0.5,
                      width: widget.width * 0.9
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: CustomPaint(
                  painter: SpritePainter(_controller),
                )),
            Center(
                child: Image.asset('assets/images/music_icon.png',
                  width: 30,
                  height: 30,
                )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Color(0xffC7C5DD)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),),
                              filled: true,
                              fillColor: Color(0xff938CBE)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                          child: SizedBox()),
                      Expanded(
                        flex: 2,
                          child: ElevatedButton(onPressed: () {}, child: Text('skip')))
                    ],
                  ),
                ),
                SizedBox(height: height * 0.2,)
              ],
            )

          ],
        ),
      ),
    );
  }
}
