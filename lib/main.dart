

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }


// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DraggableChild(
//        child: FlutterLogo(
//          size: 120,
//        ),
//       ),
//     );
//   }
// }
//
//
// class DraggableChild extends StatefulWidget {
//   const DraggableChild({Key? key,required this.child }) : super(key: key);
//   final Widget child;
//
//   @override
//   _DraggableChildState createState() => _DraggableChildState();
// }
//
// class _DraggableChildState extends State<DraggableChild>with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//   Alignment _dragAlignment = Alignment.center;
//
//   @override
//   void initState(){
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose(){
//     super.dispose();
//     _controller.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       child: Card(
//         child: widget.child,
//       ),
//     );
//   }
// }



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(_createRoute());
//           },
//           child: Text('Go to second'),
//         ),
//       ),
//     );
//   }
// }
// Route _createRoute(){
//   return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => Page2(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child){
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curves = Curves.ease;
//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curves));
//         return SlideTransition(
//             position: animation.drive(tween),
//           child: child,
//         );
//   });
// }
//
// class Page2 extends StatefulWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   _Page2State createState() => _Page2State();
//
// }
//
// class _Page2State extends State<Page2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Page 2'),
//       ),
//     );
//   }
// }

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:practice_cookbook/pages/confirm_password.dart';
// import 'package:practice_cookbook/pages/forgot_password.dart';
// import 'package:practice_cookbook/pages/home_screen.dart';
// import 'package:practice_cookbook/pages/login_screen.dart';
// import 'package:practice_cookbook/pages/registration_screen.dart';
// import 'package:practice_cookbook/pages/welcome_screen.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
//
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'welcome_screen',
//       routes: {
//         'welcome_screen': (context) => WelcomeScreen(),
//         'registration_screen': (context) => RegistrationScreen(),
//         'login_screen': (context) => LoginScreen(),
//         'home_screen': (context) => HomeScreen(),
//         'forgot_password': (context) => ForgotPassword(),
//         'confirm_password': (context) => ConfirmPassword()
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
// import 'package:flutter_practice/Screens/ConfirmEmail.dart';
// import 'package:flutter_practice/Screens/ForgotPassword.dart';
// import 'package:flutter_practice/Screens/Homepage.dart';
// import 'package:flutter_practice/Screens/SignIn.dart';
// import 'package:flutter_practice/Screens/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice_cookbook/pages/confirm_password.dart';
import 'package:practice_cookbook/pages/forgot_password.dart';
import 'package:practice_cookbook/pages/home_screen.dart';
import 'package:practice_cookbook/pages/login_screen.dart';
import 'package:practice_cookbook/pages/registration_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SignUpScreen.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        HomepageScreen.id: (context) => HomepageScreen(),
        ConfirmEmail.id: (context) => ConfirmEmail(),
        ForgotPassword.id: (context) => ForgotPassword(),
      },
    );
  }
}
