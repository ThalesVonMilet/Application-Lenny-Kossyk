// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_ui_web/common/widget/text_reveal.dart';

// Project imports:

class SubtitleWidget extends StatefulWidget {
  const SubtitleWidget(
      {super.key,
        required this.text,
      });

  final String text;

  @override
  State<SubtitleWidget> createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends State<SubtitleWidget> {
  @override
  Widget build(BuildContext context) {

    return TextReveal(
      maxHeight: 100,
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
