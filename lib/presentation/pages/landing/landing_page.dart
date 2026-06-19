import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/presentation/pages/landing/calls.dart';
import 'package:chatbox/presentation/pages/landing/contacts.dart';
import 'package:chatbox/presentation/pages/landing/homepage.dart';
import 'package:chatbox/presentation/pages/landing/settings_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int pageIndex = 0;
  final pages = [
    const HomePage(),
    const CallsLandingPage(),
    const ContactsPage(),
    const SettingsPage(),
  ];

  double screenHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: pages[pageIndex],
      extendBody: false,
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: screenHeight / 11,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 1.5)],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  splashRadius: screenHeight / 30,
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Icon(
                          Icons.message,
                          color: ColorPalette.primaryColor,
                          size: screenHeight / 30,
                        )
                      : Icon(
                          Icons.message_outlined,
                          color: Colors.grey,
                          size: screenHeight / 30,
                        ),
                ),
                Text(
                  "Message",
                  style: TextStyle(
                    fontSize: screenHeight / 55,
                    color: pageIndex == 0
                        ? ColorPalette.primaryColor
                        : Colors.grey,
                    fontWeight: pageIndex == 0
                        ? FontWeight.bold
                        : FontWeight.w300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  splashRadius: screenHeight / 30,
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Icon(
                          Icons.call_sharp,
                          color: ColorPalette.primaryColor,
                          size: screenHeight / 30,
                        )
                      : Icon(
                          Icons.call_outlined,
                          color: Colors.grey,
                          size: screenHeight / 30,
                        ),
                ),
                Text(
                  "Calls",
                  style: TextStyle(
                    fontSize: screenHeight / 55,
                    color: pageIndex == 1
                        ? ColorPalette.primaryColor
                        : Colors.grey,
                    fontWeight: pageIndex == 1
                        ? FontWeight.bold
                        : FontWeight.w300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  splashRadius: screenHeight / 30,
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Icon(
                          Icons.person_2,
                          color: ColorPalette.primaryColor,
                          size: screenHeight / 30,
                        )
                      : Icon(
                          Icons.person_2_outlined,
                          color: Colors.grey,
                          size: screenHeight / 30,
                        ),
                ),
                Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: screenHeight / 55,
                    color: pageIndex == 2
                        ? ColorPalette.primaryColor
                        : Colors.grey,
                    fontWeight: pageIndex == 2
                        ? FontWeight.bold
                        : FontWeight.w300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  splashRadius: screenHeight / 30,
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? Icon(
                          Icons.settings,
                          color: ColorPalette.primaryColor,
                          size: screenHeight / 30,
                        )
                      : Icon(
                          Icons.settings_outlined,
                          color: Colors.grey,
                          size: screenHeight / 30,
                        ),
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: screenHeight / 55,
                    color: pageIndex == 3
                        ? ColorPalette.primaryColor
                        : Colors.grey,
                    fontWeight: pageIndex == 3
                        ? FontWeight.bold
                        : FontWeight.w300,
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
