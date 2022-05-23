import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'registration_screen');
                },
                child: Text('Register')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'login_screen');
                },
                child: Text('Login')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'forgot_password');
                },
                child: Text('Forgot_Password')
            ),
          ],
        ),
      ),
    );
  }
}