import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white1,
      body: Center(
        child: SvgPicture.asset(Assets.chatLogo)
      ),
    );
  }
}