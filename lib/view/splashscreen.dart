import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/cubits/home_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Text(
                        "TIC TAC TOE",
                        style: GoogleFonts.pressStart2p(textStyle: const TextStyle(fontSize: 30, color: Colors.white, letterSpacing: 3)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AvatarGlow(
                      glowCount: 2,
                      duration: const Duration(seconds: 2),
                      glowColor: Colors.white,
                      repeat: true,
                      startDelay: const Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          radius: 80.0,
                          child: Image.asset(
                            'lib/images/tictactoelogo.png',
                            color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        "@CreatedByHudhaifa",
                        style: GoogleFonts.pressStart2p(textStyle: const TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 3)),
                      ),
                    ),
                  ),
                  context.read<HomeCubit>().difficultySelected
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                context.read<HomeCubit>().computerTurn = true;
                                context.go("/computerPage");
                              },
                              child: SizedBox(
                                height: 70,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    'o',
                                    style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                context.read<HomeCubit>().computerFirstTurn();
                                context.read<HomeCubit>().computerTurn = false;
                                context.go("/computerPage");
                              },
                              child: SizedBox(
                                height: 70,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    'x',
                                    style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                context.read<HomeCubit>().setDifficultySelected(true);
                              },
                              child: SizedBox(
                                height: 70,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    '1 PLAYER',
                                    style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                context.go("/home");
                              },
                              child: SizedBox(
                                height: 70,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    '2 PLAYERS',
                                    style: GoogleFonts.pressStart2p(textStyle: const TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              );
            },
          ),
        ));
  }
}
