// import 'package:flutter/cupertino.dart';
//
// class ConfirmPassword extends StatefulWidget {
//   const ConfirmPassword({Key? key}) : super(key: key);
//
//   @override
//   _ConfirmPasswordState createState() => _ConfirmPasswordState();
// }
//
// class _ConfirmPasswordState extends State<ConfirmPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';

class ConfirmEmail extends StatefulWidget {
  static String id = 'confirm-email';
    final String? message;

  const ConfirmEmail({Key? key,  this.message}) : super(key: key);

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.message!
                ,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
      ),
    );
  }
}