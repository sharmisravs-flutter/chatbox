import 'dart:async';

import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/data/repos/auth_repo.dart';
import 'package:chatbox/data/services/auth_service.dart';
import 'package:chatbox/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = AuthController(AuthRepo(AuthServices()));
    _navigateToHome();
  }

  // 2. Create a delayed mechanism for navigation
  void _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        if (authController.getCurrentUser() != null) {
          context.pushReplacement('/landing');
        } else {
          context.pushReplacement('/onboarding');
        }
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
