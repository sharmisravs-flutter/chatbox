import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/validator.dart';
import 'package:chatbox/presentation/widgets/custom_button.dart';
import 'package:chatbox/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isLoginActive = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: ColorPalette.black,
            size: screenHeight / 37.5,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight / 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight / 30),
                  Text(
                    'Log in to Chatbox',
                    style: TextStyle(
                      fontSize: screenHeight / 45,
                      color: ColorPalette.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight / 80),
                  Text(
                    'Welcome back! Sign in using your social\naccount or email to continue us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.grey100,
                      fontSize: screenHeight / 45,
                    ),
                  ),
                  SizedBox(height: screenHeight / 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.facebook,
                          height: screenHeight / 18,
                          width: screenHeight / 18,
                        ),
                      ),
                      SizedBox(width: screenHeight / 90),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.google,
                          height: screenHeight / 18,
                          width: screenHeight / 18,
                        ),
                      ),
                      SizedBox(width: screenHeight / 90),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.apple,
                          height: screenHeight / 18,
                          width: screenHeight / 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight / 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth / 2.5,
                        height: .5,
                        decoration: BoxDecoration(color: ColorPalette.grey100),
                      ),
                      Text('OR'),
                      Container(
                        width: screenWidth / 2.5,
                        height: .5,
                        decoration: BoxDecoration(color: ColorPalette.grey100),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight / 45),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      title: "Your Email",
                      controller: emailController,
                      validator: Validator.validateEmail,
                    ),
                    SizedBox(height: screenHeight / 50),
                    CustomTextField(
                      title: "Your Password",
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: screenHeight / 45),

                  CustomButton(
                    borderRadius: screenHeight / 50,
                    text: "Login",
                    padding: EdgeInsets.symmetric(
                      horizontal: screenHeight / 20,
                      vertical: screenWidth / 45,
                    ),
                    textColor: Colors.white,
                    fillColor: ColorPalette.primaryColor,
                    textSize: screenHeight / 45,
                  ),
                  SizedBox(height: screenHeight / 45),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
