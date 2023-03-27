import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stakanto/image_list.dart';
import 'package:stakanto/screen/login_screen.dart';

import '../service/dio/api_service.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  String img_link = "https://cdn.discordapp.com/attachments/872481713949917228/1062208607053156422/image.png";
  late Service service = Service();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Random random = Random();
    int randomIndex = random.nextInt(ImageLinks.links.length);
    return Scaffold(
      backgroundColor: Color(0xff4B4093),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SignUp',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Image.network(
              img_link, // 이미지 링크
              fit: BoxFit.cover, // 이미지가 위젯 크기보다 클 경우 자동으로 크기를 조절합니다.
              width: 110, // 위젯의 가로 크기
              height: 110, // 위젯의 세로 크기
            ),
            IconButton(onPressed: () {
              setState(() {
                img_link = ImageLinks.links[randomIndex];
              });
            }, icon: Icon(Icons.refresh, color: Colors.white,)),
            SizedBox(
              height: 30,
            ),
            TextInput(_idController, width, 'Input Nickname'),
            TextInput(_passwordController, width, 'Input ID'),
            TextInput(_nickNameController, width, 'Input Password'),
            SizedBox(
              child: ElevatedButton(
                onPressed: _signUp,
                child: const Text(
                  'SignUp',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xff342D67)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding TextInput(
      TextEditingController controller, double width, String label) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: width * 0.1, right: width * 0.1),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Color(0xffC7C5DD)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color(0xffFDFDFD), width: 2)),
            filled: true,
            fillColor: Color(0xff938CBE)),
      ),
    );
  }

  _signUp() async {
    final result = await service.signUp(_idController.text, _passwordController.text,
        img_link.toString() , _nickNameController.text);
    print('클릭');

    if (result == '성공') {
      print(img_link.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginScreen()));

    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('회원가입 실패'),
          content: Text('아이디와 비밀번호를 확인해주세요.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        ),
      );
    }
  }
}
