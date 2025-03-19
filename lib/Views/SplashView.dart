import 'package:carwash/Constants/AppColors.dart';
import 'package:carwash/Views/LandingView.dart';
import 'package:carwash/Views/LoginView.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).whenComplete((){
      if(mounted){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LandingView()), (route)=>false);
      }
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          maxRadius: 60,
          backgroundColor: indClr,
          child: Icon(Icons.car_crash,color: bgColor,size: 40,),
        ),
      ),
    );
  }
}
