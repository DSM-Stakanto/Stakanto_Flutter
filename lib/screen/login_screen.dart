import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stakanto/screen/home_screen.dart';
import 'package:stakanto/service/dio/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  bool _isLoading = false;
  String? _errorMessage;
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff4B4093),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      )),
                )
              ],
            ),
            TextInput(_idController, width, 'Input ID'),
            TextInput(_passwordController, width, 'Input Password'),
            SizedBox(
              width: width * 0.8,
              child: ElevatedButton(
                onPressed:_login,
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff342D67),
                ),
              ),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Colors.red,
                  ),
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

  _login() async {
    print('클릭');
    try {
      final result = await service.login(_idController.text, _passwordController.text);

      if (result == '성공') {
        print('성공');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print('실패');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('로그인 실패'),
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
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('로그인 실패'),
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
