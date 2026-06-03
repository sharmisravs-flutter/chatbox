import 'package:chatbox/presentation/pages/homepage.dart';
import 'package:chatbox/presentation/pages/login.dart';
import 'package:chatbox/presentation/pages/onboarding_page.dart';
import 'package:chatbox/presentation/pages/signup.dart';
import 'package:chatbox/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'onboarding',
            builder: (BuildContext context, GoRouterState state) {
              return const OnboardingPage();
            },
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'signup',
            builder: (context, state) {
              return SignupPage();
            },
          ),
          GoRoute(
            path: 'home',
            builder: (context, state) {
              return HomePage();
            },
          ),
        ],
      ),
    ],
  );
}
