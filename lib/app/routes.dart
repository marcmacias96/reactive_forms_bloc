import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';




final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      },
      
    ),
    GoRoute(
      path: '/sign_up',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
  ],
);
