import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/cubits/home_cubit.dart';
import 'package:tictactoe/view/computerpage.dart';
import 'package:tictactoe/view/homepage.dart';
import 'package:tictactoe/view/splashscreen.dart';

class Routing {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'computerPage',
        path: '/computerPage',
        builder: (context, state) => const ComputerPage(),
      ),
    ],
  );
}
