import 'package:flutter/material.dart';
import 'package:foodies_app/auth/email_auth.dart';
import 'package:foodies_app/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future <void> main() async{  
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences= await SharedPreferences.getInstance();
 initScreen= (await preferences.getInt('initScreen'));
 await preferences.setInt('initScreen',1);
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VIN'S FOOD ORDERING APP",
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen==0|| initScreen==null? 'onboard':'home',
      routes: {
        'home':(context) => SplashHome(),
        'onboard':(context) => EmailHome()
      }, 
    );
  }
}
