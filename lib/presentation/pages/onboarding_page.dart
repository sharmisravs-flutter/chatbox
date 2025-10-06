import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.black,
      body: Padding(
        padding: EdgeInsets.all(screenHeight/20),
        child: Column(
          children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.onboardingImage),
                     SizedBox(width: screenHeight/90,),
                     Text("ChatBox", style: TextStyle(color: ColorPalette.white1, fontSize: screenHeight/64.2, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Text("Connect friends easily & quickly"),
              Text("Our chat app is the perfect way to stay connected with friends and family.")
            ],
        ),
      )
    );
  }
}