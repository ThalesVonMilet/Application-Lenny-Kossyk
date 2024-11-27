import 'package:crypto_ui_web/motivation_letter/widget/text_reveal.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget(
      {super.key,
      required this.controller,
      required this.text,
       this.textOpacityAnimation,
       this.textRevealAnimation,
       this.padding});

  final EdgeInsets? padding;
  final Animation<double>? textOpacityAnimation;
  final Animation<double>? textRevealAnimation;
  final AnimationController controller;
  final String text;

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? const EdgeInsets.only(bottom: 0),
        child: TextReveal(
          maxHeight: 50,
          controller: widget.controller,
          textOpacityAnimation: widget.textOpacityAnimation,
          textRevealAnimation: widget.textRevealAnimation,
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
