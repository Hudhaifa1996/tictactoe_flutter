import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/cubits/home_cubit.dart';
import 'package:tictactoe/routing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => HomeCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TicTacToe App',
        routerConfig: Routing.router,
      ),
    ),
  );
}
