import 'package:crypto_ui_web/motivation_letter/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HeadingWidget extends StatefulWidget {
  const HeadingWidget(
      {super.key,
        required this.text,
        this.padding});

  final EdgeInsets? padding;
  final String text;

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {

    return TextReveal(
      maxHeight: 50,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'CH',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
