import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final int maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      wrapWords: false,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
