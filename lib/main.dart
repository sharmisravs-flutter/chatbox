import 'package:chatbox/presentation/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "chatbox",
    options: FirebaseOptions(
      apiKey: "AIzaSyAZPzFN-yl2R9XIue0E0MAqRHh9-9I1bZk",
      authDomain: "chatbox-a9a34.firebaseapp.com",
      projectId: "chatbox-a9a34",
      storageBucket: "chatbox-a9a34.firebasestorage.app",
      messagingSenderId: "488039957129",
      appId: "1:488039957129:web:f2e34a495cbfdcd1e13c58",
      measurementId: "G-DVSLHLGR0B",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
