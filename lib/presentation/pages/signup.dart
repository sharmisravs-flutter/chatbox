// ignore_for_file: unused_import

import 'package:chatbox/core/utils/Validations.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/data/repos/auth_repo.dart';
import 'package:chatbox/data/services/auth_service.dart';
import 'package:chatbox/presentation/controllers/auth_controller.dart';
import 'package:chatbox/presentation/widgets/IconButtonwithBorder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController confirmPWController;

  bool isValidData = false;
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  late final AuthController authController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPWController = TextEditingController();
    authController = AuthController(AuthRepo(AuthServices()));
    super.initState();
  }

  void _validateForm() {
    setState(() {
      isValidData = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenHeight / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Sign up with Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight / 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight / 40),
            Center(
              child: Text(
                "Get chatting with friends and family today by\nsigning up for out chat app!",
                style: TextStyle(
                  fontSize: screenHeight / 40,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: screenHeight / 40,
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: Validations.validateName,
                    onChanged: (_) => _validateForm(),
                  ),
                  SizedBox(height: screenHeight / 60),
                  Text(
                    "Your email",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: screenHeight / 40,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: Validations.validateEmail,
                    onChanged: (_) => _validateForm(),
                  ),
                  SizedBox(height: screenHeight / 60),
                  Text(
                    "Your Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: screenHeight / 40,
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: Validations.validatePassword,
                    obscureText: !showPassword,
                    onChanged: (value) => _validateForm(),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 60),
                  Text(
                    "Confirm Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: screenHeight / 40,
                    ),
                  ),
                  TextFormField(
                    controller: confirmPWController,
                    validator: (value) {
                      if (value?.compareTo(passwordController.text) != 0) {
                        return "Enter same password as above";
                      }
                      return null;
                    },
                    obscureText: true,
                    onChanged: (value) => _validateForm(),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: isValidData
                      ? () async {
                          String result = await authController.signUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          if (result == 'success') {
                            context.pushReplacement('/landing');
                          } else {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(result)));
                          }
                        }
                      : null,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isValidData
                          ? ColorPalette.primaryColor
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenHeight / 20,
                      vertical: screenHeight / 40,
                    ),
                    child: Text(
                      "Signup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isValidData ? Colors.white : Colors.blueGrey,
                        fontSize: screenHeight / 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
