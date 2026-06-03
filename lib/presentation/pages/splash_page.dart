import 'dart:async';

import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // 2. Create a delayed mechanism for navigation
  void _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.pushReplacement('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white1,
      body: Center(child: SvgPicture.asset(Assets.chatLogo)),
    );
  }
}
