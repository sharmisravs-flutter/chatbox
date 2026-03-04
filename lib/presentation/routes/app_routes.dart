import 'package:chatbox/presentation/pages/home/home_page.dart';
import 'package:chatbox/presentation/pages/login.dart';
import 'package:chatbox/presentation/pages/onboarding_page.dart';
import 'package:chatbox/presentation/pages/registration.dart';
import 'package:chatbox/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashPage()),
      GoRoute(
        path: '/on-boarding',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LogInPage()),
      GoRoute(
        path: "/registration",
        builder: (context, state) => RegistrationPage(),
      ),
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
    ],
  );
}
