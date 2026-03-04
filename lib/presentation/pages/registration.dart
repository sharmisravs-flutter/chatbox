import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/validator.dart';
import 'package:chatbox/presentation/widgets/custom_button.dart';
import 'package:chatbox/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isLoginActive = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
                    'Sign up with Email',
                    style: TextStyle(
                      fontSize: screenHeight / 45,
                      color: ColorPalette.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight / 80),
                  Text(
                    "Get chatting with friends and family today by\nsigning up for our chat app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.grey100,
                      fontSize: screenHeight / 45,
                    ),
                  ),
                  SizedBox(height: screenHeight / 45),
                ],
              ),
              SizedBox(height: screenHeight / 45),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      title: "Your Name",
                      controller: nameController,
                      validator: Validator.validateEmail,
                    ),
                    SizedBox(height: screenHeight / 50),
                    CustomTextField(
                      title: "Your Email",
                      controller: emailController,
                      validator: Validator.validateEmail,
                    ),
                    SizedBox(height: screenHeight / 50),
                    CustomTextField(
                      title: "Password",
                      controller: passwordController,
                      validator: Validator.validatePassword,
                    ),
                    SizedBox(height: screenHeight / 50),
                    CustomTextField(
                      title: "Confirm Password",
                      controller: confirmPasswordController,
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
                    text: "Create an account",
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
