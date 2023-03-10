import 'package:flutter/material.dart';
import 'package:stakanto/page/mainsong_page.dart';
import 'package:stakanto/page/serveculture_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  final List _widgetOptions = [
    const MainSongPage(),
    const ServeCulturePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff7758D1), Color(0xffE000FF)]
              )
          ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.music_note),
          label: 'main'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.music_note_outlined),
            label: 'serve'
        ),

      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
