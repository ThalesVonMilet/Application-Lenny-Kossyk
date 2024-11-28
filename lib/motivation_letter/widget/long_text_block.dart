import 'package:flutter/material.dart';

class LongTextBlockWidget extends StatefulWidget {
  const LongTextBlockWidget({
    super.key,
    required this.text,
    required this.transform,
  });

  final Animation<Offset> transform;
  final String text;

  @override
  State<LongTextBlockWidget> createState() => _LongTextBlockWidgetState();
}

class _LongTextBlockWidgetState extends State<LongTextBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: SlideTransition(
          position: widget.transform,
          // opacity: subTextOpacityAnimation,
          child: Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'CH',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
