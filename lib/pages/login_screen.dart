// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
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
//         body: ModalProgressHUD(
//           inAsyncCall: showProgress,
//           child:  Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       labelText: 'Enter your email'
//                   ),
//                   onChanged: (value){ email = value;},
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       labelText: 'Enter your password'
//                   ),
//                   onChanged: (value){ password = value;},
//                 ),
//                 SizedBox(height: 20,),
//                 ElevatedButton(
//                     onPressed: ()async{
//                       setState(() {
//                         showProgress = true;
//                       });
//
//                       try {
//                         final User = await _auth.signInWithEmailAndPassword(email: email,password: password);
//                         if (User != null){
//                           Navigator.pushNamed(context, 'home_screen');
//                         }
//                       }
//                       catch (e){
//                         print(e);
//                       }
//                       setState(() {
//                         showProgress = false;
//                       });
//                     },
//                     child: Text('Login')
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forgot_password.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign-in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String? _email;

  String? _password;

  Future signIn() async {
    _formKey.currentState?.save();
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user.user.emailVerified) {
        Navigator.pushNamed(context, HomepageScreen.id);
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
                    'Sign In Here',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (newEmail) {
                      _email = newEmail;
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
                    onSaved: (newPass) {
                      _password = newPass;
                    },
                    obscureText: true,
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
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ForgotPassword.id,
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle( fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}