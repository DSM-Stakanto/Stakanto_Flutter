import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff7758D1), Color(0xffE000FF)]
              )
          ),
        child: Center(
          child: Text('HelloWorld'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
