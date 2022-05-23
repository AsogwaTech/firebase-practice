
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
//
//
// final String message = 'an email has been sent to you, click on the link to get verified';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _auth = FirebaseAuth.instance;
//
//   String? email;
//   String? password;
//   bool showProgress = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ModalProgressHUD(
//         inAsyncCall: showProgress,
//         child:  Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your email'
//                 ),
//                 onChanged: (value){ email = value;},
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     labelText: 'Enter your password'
//                 ),
//                 onChanged: (value){ password = value;},
//               ),
//               SizedBox(height: 20,),
//               ElevatedButton(
//                   onPressed: ()async{
//                     setState(() {
//                       showProgress = true;
//                     });
//
//                     try {
//                       final newUser = await _auth.createUserWithEmailAndPassword(email: email,password: password);
//                       await newUser.user.sendEmailVerification();
//                       if (newUser != null){
//                         print(newUser);
//                         Navigator.pushNamed(context, 'home_screen');
//                       }
//                     }
//                     catch (e){
//                       print(e);
//                     }
//                     setState(() {
//                       showProgress = false;
//                     });
//                   },
//                   child: Text('Register')
//               ),
//             ],
//           ),
//         ),
//       )
//     );
//   }
//}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'confirm_password.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign-up';
  final String message =
      "An email has just been sent to you, Click the link provided to complete registration";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  String? _email;

  String? _password;

  Future signUp() async {
    _formKey.currentState?.save();
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      await newUser.user.sendEmailVerification();
      if (newUser != null) {
        MaterialPageRoute(
          builder: (context) {
            return ConfirmEmail(
              message: widget.message,
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up Here',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (emailValue) {
                      _email = emailValue;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    onSaved: (passValue) {
                      _password = passValue;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      errorStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: signUp,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                    child: Text('Sign In'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}