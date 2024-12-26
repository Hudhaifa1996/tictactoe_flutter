import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<String> displayExOh = List.filled(9, ''); // Initialize with empty strings
  bool difficultySelected = false;
  bool ohTurn = true; // First player is 'o'
  bool firstTurn = false;
  bool computerTurn = true;
  bool isEnd = false;
  int ohScore = 0;
  int exScore = 0;
  int drawScore = 0;
  int filledBoxes = 0;
  String winner = "";
  Random random = Random();

  void setDifficultySelected(bool selected) {
    difficultySelected = selected;
    emit(HomeInitial());
  }

  void tapped(int index) {
    if (displayExOh[index] == '') {
      displayExOh[index] = ohTurn ? 'o' : 'x';
      filledBoxes++;
      ohTurn = !ohTurn;
      emit(HomeInitial()); // Emit state to trigger rebuild
      checkWinner();
    }
  }

  void computerFirstTurn() {
    firstTurn = true;
    displayExOh[random.nextInt(8)] = 'o';
    filledBoxes++;
    // emit(HomeInitial());
  }

  void tappedComputer(int index) {
    if (displayExOh[index] == '') {
      displayExOh[index] = computerTurn ? 'o' : 'x';
      filledBoxes++;
      emit(HomeInitial());
      checkWinner();
      if (!isEnd) {
        List<int> emptyIndices = [];
        for (int i = 0; i < 9; i++) {
          if (displayExOh[i].isEmpty) {
            emptyIndices.add(i);
          }
        }
        emptyIndices.isNotEmpty ? displayExOh[emptyIndices[random.nextInt(emptyIndices.length)]] = computerTurn ? 'x' : 'o' : null;
        filledBoxes++;
        emit(HomeInitial());
        checkWinner();
      }
    }
  }

  void checkWinner() {
    const List<List<int>> winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winningPositions) {
      if (displayExOh[positions[0]] == displayExOh[positions[1]] && displayExOh[positions[0]] == displayExOh[positions[2]] && displayExOh[positions[0]] != '') {
        winner = displayExOh[positions[0]];
        if (winner == "o") {
          ohScore++;
          isEnd = true;
        } else if (winner == "x") {
          exScore++;
          isEnd = true;
        }
        emit(HomeWin());
      }
    }

    if (filledBoxes == 9) {
      drawScore++;
      isEnd = true;
      emit(HomeDraw());
    }
  }

  void clearBoard() {
    isEnd = false;
    displayExOh = List.filled(9, '');
    ohTurn = true;
    filledBoxes = 0;
    winner = "";
    if (firstTurn) {
      computerFirstTurn();
    }
    emit(HomeInitial());
  }
}
