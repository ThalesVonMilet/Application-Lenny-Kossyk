import 'package:crypto_ui_web/motivation_letter/widget/text_reveal.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {super.key,
        required this.text,
        this.enabled = false,
        this.onPressed
      });

  final bool enabled;
  final String text;
  final Function()? onPressed;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    bool enabled = widget.enabled;

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 50),
        backgroundColor: enabled ? AppColors.secondaryColor : Colors.transparent,
        side: enabled ? null : const BorderSide(color: AppColors.secondaryColor),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: 'CH',
          fontSize: 13,
          color: enabled ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
