import 'package:crypto_ui_web/motivation_letter/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget(
      {super.key,
      required this.text,
       this.padding});

  final EdgeInsets? padding;
  final String text;

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget>  {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? const EdgeInsets.only(bottom: 0),
        child: TextReveal(
          maxHeight: 50,
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'CH',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }
}
