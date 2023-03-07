import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            TextInput(width, 'Input ID'),
            TextInput(width, 'Input Password'),
            SizedBox(

                child: ElevatedButton(
                  onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff342D67)
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Padding TextInput(double width, String label) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: width * 0.1, right: width * 0.1),
      child: TextFormField(
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
}
