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
    return Scaffold(
      backgroundColor: Color(0xff4B4093),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          games('K-POP', 'POP'),
          games('J-POP', 'GAME')
        ],
      )
    );
  }

  Column games(String genre1, String genre2) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            game(genre1),
            game(genre2)
          ],
        );
  }

  GestureDetector game(String genre) {
    return GestureDetector(
      onTap: () {
        print(genre);
        Navigator.push(context,
        MaterialPageRoute(builder:
        (context) => KpopScreen()
        ));
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffE000FF),
        ),
        child: Center(
          child: Text(
            genre,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ),
    );
  }
}
