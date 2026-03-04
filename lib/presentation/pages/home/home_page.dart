import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Column(children: [Icon(Icons.message), Text("Messages")]),
                Column(children: [Icon(Icons.message), Text("Messages")]),
                Column(children: [Icon(Icons.message), Text("Messages")]),
                Column(children: [Icon(Icons.message), Text("Messages")]),
              ],
            ),
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: (Colors.white)),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: screenHeight / 35,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: screenHeight / 20,
                  width: screenHeight / 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenHeight / 20),
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              ListView.builder(itemBuilder: (context, i) => Container()),
            ],
          ),
        ),
      ),
    );
  }
}
