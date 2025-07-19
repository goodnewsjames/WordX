import 'package:flutter/material.dart';

class FilledBoxWidget extends StatelessWidget {
  const FilledBoxWidget({super.key, required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(4),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0XFF3E87FF),
      ),
      child: Text(
        letter,
        style: TextStyle(
          fontFamily: "Comic-Helvetic",
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
