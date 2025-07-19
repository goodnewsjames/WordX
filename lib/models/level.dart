class Level {
  Level({
    required this.levelNumber,
    required this.word,
    required this.hint,
    required this.keyboardCharacters,
  });
  final int levelNumber; // Level identifier
  final String word; // The word to guess (4 letters)
  final String hint; // Hint for the level
  final List<String>
  keyboardCharacters; // Available characters for the keyboard

  factory Level.fromJson(Map<String, dynamic> json) =>
      Level(
        levelNumber: json['levelNumber'],
        word: json['word'],
        hint: json['hint'],
        keyboardCharacters: List<String>.from(
          json['keyboardCharacters'],
        ),
      );

  Map<String, dynamic> toJson() => {
    'levelNumber': levelNumber,
    'word': word,
    'hint': hint,
    'keyboardCharacters': keyboardCharacters,
  };
}
