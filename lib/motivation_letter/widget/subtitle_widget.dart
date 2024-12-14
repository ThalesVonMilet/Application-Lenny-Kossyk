import 'package:crypto_ui_web/motivation_letter/widget/text_reveal.dart';
import 'package:flutter/material.dart';

class SubtitleWidget extends StatefulWidget {
  const SubtitleWidget(
      {super.key,
        required this.controller,
        required this.text,
        this.padding});

  final EdgeInsets? padding;
  final AnimationController controller;
  final String text;

  @override
  State<SubtitleWidget> createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends State<SubtitleWidget> {
  @override
  Widget build(BuildContext context) {
    return TextReveal(
      maxHeight: 50,
      controller: widget.controller,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: 'CH',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
