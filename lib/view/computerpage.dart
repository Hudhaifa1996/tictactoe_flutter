import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/cubits/home_cubit.dart';

class ComputerPage extends StatelessWidget {
  const ComputerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeWin) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('WINNER IS: ${context.read<HomeCubit>().winner}'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Play Again!'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        context.read<HomeCubit>().clearBoard(); // Clear the board
                      },
                    ),
                  ],
                );
              },
            );
          } else if (state is HomeDraw) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('DRAW'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Play Again!'),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        context.read<HomeCubit>().clearBoard(); // Clear the board
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: <Widget>[
              const SizedBox(height: 80),
              Expanded(
                child: Wrap(
                  spacing: 40.0, // Horizontal space between elements
                  // runSpacing: 5.0, // Vertical space between rows
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player O',
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 13)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          context.read<HomeCubit>().ohScore.toString(),
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Draw',
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 13)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          context.read<HomeCubit>().drawScore.toString(),
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 13)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Player X',
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          context.read<HomeCubit>().exScore.toString(),
                          style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => context.read<HomeCubit>().tappedComputer(index),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade700)),
                        child: Center(
                          child: Text(
                            context.read<HomeCubit>().displayExOh[index],
                            style: const TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'TIC TAC TOE',
                        style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        '@CreatedByMHudhaifa',
                        style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
