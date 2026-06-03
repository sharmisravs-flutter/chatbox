import 'package:chatbox/core/utils/Validations.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/presentation/widgets/IconButtonwithBorder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isValidData = false;
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
    double screenWidth = MediaQuery.of(context).size.width;

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
                "Log in to Chatbox",
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
                "Welcome back! Sign in using your social\naccount or email to continue us",
                style: TextStyle(
                  fontSize: screenHeight / 40,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: screenHeight / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: screenWidth / 15),
                Iconbuttonwithborder(
                  icon: Icons.facebook,
                  color: Colors.black,
                  onTap: () {
                    debugPrint("Login with FaceBook");
                  },
                ),
                Iconbuttonwithborder(
                  icon: Icons.mail,
                  color: Colors.black,
                  onTap: () {
                    debugPrint("Login with Gmail");
                  },
                ),
                Iconbuttonwithborder(
                  icon: Icons.apple,
                  color: Colors.black,
                  onTap: () {
                    debugPrint("Login with Apple Account");
                  },
                ),
                SizedBox(width: screenWidth / 15),
              ],
            ),
            SizedBox(height: screenHeight / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: screenWidth / 3,
                  child: Divider(thickness: 2, color: Colors.grey),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight / 50,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 3,
                  child: Divider(thickness: 2, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: isValidData ? () {} : null,
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
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isValidData ? Colors.white : Colors.blueGrey,
                        fontSize: screenHeight / 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: screenHeight / 40,
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
