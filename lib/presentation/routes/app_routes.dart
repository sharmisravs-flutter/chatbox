import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/presentation/pages/chat/chat_history_page.dart';
import 'package:chatbox/presentation/pages/landing/calls.dart';
import 'package:chatbox/presentation/pages/landing/contacts.dart';
import 'package:chatbox/presentation/pages/landing/homepage.dart';
import 'package:chatbox/presentation/pages/landing/landing_page.dart';
import 'package:chatbox/presentation/pages/landing/settings_page.dart';
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
            path: 'landing',
            builder: (context, state) {
              return LandingPage();
            },
          ),
          GoRoute(
            path: 'home',
            builder: (context, state) {
              return HomePage();
            },
          ),
          GoRoute(
            path: 'calls',
            builder: (context, state) {
              return CallsLandingPage();
            },
          ),
          GoRoute(
            path: 'contacts',
            builder: (context, state) {
              return ContactsPage();
            },
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) {
              return SettingsPage();
            },
          ),

          GoRoute(
            path: '/chatHistory',
            builder: (context, state) {
              final args = state.extra as ChatHistoryArgs;

              return ChatHistory(
                user: args.user,
                currentUser: args.currentUser,
              );
            },
          ),
        ],
      ),
    ],
  );
}
