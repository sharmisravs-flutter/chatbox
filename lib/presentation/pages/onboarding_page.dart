import 'package:chatbox/core/utils/assets.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chatbox/presentation/widgets/IconButtonwithBorder.dart';
import 'package:go_router/go_router.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: [
              Colors.black,
              Colors.black,
              const Color.fromARGB(255, 50, 28, 87),
              Colors.black,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenHeight / 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.onboardingImage,
                          height: screenHeight / 30,
                          width: screenHeight / 30,
                        ),
                        SizedBox(width: screenHeight / 90),
                        Text(
                          "ChatBox",
                          style: TextStyle(
                            color: ColorPalette.white1,
                            fontSize: screenHeight / 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Connect friends ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight / 15,
                      ),
                      children: [
                        TextSpan(
                          text: "easily & quickly",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight / 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight / 80),
                  Text(
                    "Our chat app is the perfect way to stay connected with friends and family.",
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: screenWidth / 15),
                      Iconbuttonwithborder(
                        icon: Icons.facebook,
                        color: Colors.white,
                        onTap: () {
                          debugPrint("Login with FaceBook");
                        },
                      ),
                      Iconbuttonwithborder(
                        icon: Icons.mail,
                        color: Colors.white,
                        onTap: () {
                          debugPrint("Login with Gmail");
                        },
                      ),
                      Iconbuttonwithborder(
                        icon: Icons.apple,
                        color: Colors.white,
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
                          color: Colors.white,
                          fontSize: screenHeight / 50,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 3,
                        child: Divider(thickness: 2, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight / 40),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        context.push('/signup');
                      },
                      child: Text(
                        "Signup with email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: screenHeight / 40,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  TextButton(
                    onPressed: () {
                      context.push('/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Existing Account?",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: " LogIn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
