import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordx/models/constants.dart';
import 'dart:math';
import 'package:wordx/models/level.dart';
import 'package:wordx/views/widgets/level_passed_box.dart';

class GameController extends GetxController {
  final GetStorage _storage = GetStorage();
  late List<Level> levels;

  var enteredLetters = <String>[].obs;
  var currentWordLength = 0.obs;
  var currentLevel = 1.obs;
  var trialsLeft = 6.obs;
  var feedbackMessage = ''.obs;
  var isLevelPassed = false.obs;
  var isWrongGuess = false.obs;
  var totalPoints = 0.obs;
  var gameState = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadLevels();
    currentLevel.value = _storage.read('currentLevel') ?? 1;
    trialsLeft.value = _storage.read('trialsLeft') ?? 6;
    totalPoints.value = _storage.read('totalPoints') ?? 0;
    currentWordLength.value = levels
        .firstWhere(
          (level) =>
              level.levelNumber == currentLevel.value,
          orElse: () => levels.first,
        )
        .word
        .length
        .toInt();
    enteredLetters.value = List.filled(
      currentWordLength.value,
      "",
    );
    refresh();
  }

  void loadLevels() {
    if (_storage.hasData('levels')) {
      levels = (_storage.read('levels') as List)
          .map((json) => Level.fromJson(json))
          .toList();
    } else {
      levels = generateLevels();
      _storage.write(
        'levels',
        levels.map((level) => level.toJson()).toList(),
      );
    }
  }

  List<Level> generateLevels() {
    final random = Random();
    return List.generate(Constants.wordHintPairs.length, (
      index,
    ) {
      final wordHint = Constants.wordHintPairs[index];
      final word = wordHint['word']!;
      final wordLetters = word.toLowerCase().split('');
      final extraLetterCount = (12 - wordLetters.length)
          .clamp(0, 12);
      final extraLetters = <String>[];
      for (var i = 0; i < extraLetterCount; i++) {
        extraLetters.add(
          String.fromCharCode(97 + random.nextInt(26)),
        );
      }
      final keyboardCharacters = [
        ...wordLetters,
        ...extraLetters,
      ]..shuffle(random);
      return Level(
        levelNumber: index + 1,
        word: word,
        hint: wordHint['hint']!,
        keyboardCharacters: keyboardCharacters,
      );
    });
  }

  void deleteLastLetter() {
    if (isLevelPassed.value) return;
    int index = enteredLetters.lastIndexWhere(
      (e) => e.isNotEmpty,
    );
    if (index != -1) {
      enteredLetters[index] = '';
      enteredLetters.refresh();
    }
  }

  void submitGuess() {
    if (isLevelPassed.value) return;
    if (trialsLeft.value <= 0) {
      feedbackMessage.value =
          'No trials left! Please buy more trials.';
      gameState.value = 'snackbar_out_of_trials';
      Future.delayed(Duration(seconds: 3), () {
        feedbackMessage.value = "";
      });
      return;
    }
    String guess = enteredLetters.join();
    String correctWord = levels
        .firstWhere(
          (level) =>
              level.levelNumber == currentLevel.value,
        )
        .word;
    trialsLeft.value--;
    _storage.write('trialsLeft', trialsLeft.value);
    if (guess == correctWord) {
      isLevelPassed.value = true;
      totalPoints.value += 10;
      _storage.write('totalPoints', totalPoints.value);
      
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
          child: LevelPassedBox(),
        ),
      );
      Future.delayed(Duration(seconds: 3), () {
        Get.back();
      });
      nextLevel();
    } else {
      if (trialsLeft.value <= 0) {
        feedbackMessage.value =
            'No trials left! Please buy more trials.';
        gameState.value = 'snackbar_out_of_trials';
        Future.delayed(Duration(seconds: 3), () {
          feedbackMessage.value = "";
        });
        return;
      }
      isWrongGuess.value = true;
      feedbackMessage.value = 'Incorrect guess. Try again!';
      gameState.value = 'snackbar_try_again';
      Future.delayed(Duration(seconds: 3), () {
        feedbackMessage.value = "";
      });
      enteredLetters.value = List.filled(
        currentWordLength.value,
        "",
      );
    }
  }

  void addLetter(String letter) {
    if (isLevelPassed.value) return;
    if (trialsLeft.value <= 0) {
      feedbackMessage.value =
          'No trials left! Please buy more trials.';
      gameState.value = 'snackbar_out_of_trials';
      Future.delayed(Duration(seconds: 3), () {
        feedbackMessage.value = "";
      });
      enteredLetters.value = List.filled(
        currentWordLength.value,
        "",
      );
      return;
    }
    int index = enteredLetters.indexOf('');
    if (index != -1) {
      enteredLetters[index] = letter;
      enteredLetters.refresh();
      if (!enteredLetters.contains('')) {
        Future.delayed(Duration(seconds: 1), () {
          if (!isLevelPassed.value) {
            submitGuess();
            if (isWrongGuess.value) {
              Future.delayed(Duration(seconds: 1), () {
                isWrongGuess.value = false;
              });
            }
          }
        });
      }
    }
  }

  void nextLevel() {
    if (currentLevel.value < levels.length) {
      currentLevel.value++;
      _storage.write('currentLevel', currentLevel.value);
      resetLevel();
    } else {
      feedbackMessage.value =
          'Congratulations! All levels completed!';
      gameState.value = 'snackbar_game_over';
      Future.delayed(Duration(seconds: 3), () {
        feedbackMessage.value = "";
      });
    }
  }

  void resetLevel() {
    currentWordLength.value = levels
        .firstWhere(
          (level) =>
              level.levelNumber == currentLevel.value,
        )
        .word
        .length
        .clamp(4, double.infinity)
        .toInt();
    enteredLetters.value = List.filled(
      currentWordLength.value,
      "",
    );
    isLevelPassed.value = false;
    feedbackMessage.value = '';
    trialsLeft.value = 6;
    _storage.write('trialsLeft', trialsLeft.value);
    gameState.value = '';
  }

  void buyTrials() {
    trialsLeft.value += 1;
    _storage.write('trialsLeft', trialsLeft.value);
    feedbackMessage.value = 'Purchased 1 more trials!';
    gameState.value = 'snackbar_trials_purchased';
    Future.delayed(Duration(seconds: 3), () {
      feedbackMessage.value = "";
    });
  }

  void reducePoints() {
    totalPoints.value -= 10;
    _storage.write('totalPoints', totalPoints.value);
    feedbackMessage.value = "You shouldn't done that!!";
    gameState.value = "snackbar_points_reduced";
    Future.delayed(Duration(seconds: 3), () {
      feedbackMessage.value = "";
    });
  }

  Level getCurrentLevel() {
    return levels.firstWhere(
      (level) => level.levelNumber == currentLevel.value,
    );
  }

  
}
