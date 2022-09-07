import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies_app/views/home.dart';

import 'package:lottie/lottie.dart';
class SplashHome extends StatefulWidget {
  SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>FoodHome()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Lottie.asset('assets/images/splash_screen.json'),
      ),
    );
  }
}