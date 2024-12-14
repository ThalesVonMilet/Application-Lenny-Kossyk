// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/motivation_letter/widget/long_text_block.dart';
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
import 'package:flutter/material.dart';

// Package imports:

import '../widget/title_widget.dart';

class MotivationFuture extends StatefulWidget {
  const MotivationFuture({super.key});

  @override
  State<MotivationFuture> createState() => _MotivationFutureState();
}

class _MotivationFutureState extends State<MotivationFuture> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        const SizedBox(
          height: 10,
        ),
        TitleWidget(text: 'For the future'),
        const SizedBox(
          height: 30,
        ),
        LongTextBlockWidget(
            text:
                'For the future I hope to gather as much knowledge as possible. Especially in learning how to think abstractly, where this internship will for certain assist me at. In the long run I want to do something better, how I will achieve this I don’t know now but I want to create my own Company one day. ',
            ),
        LongTextBlockWidget(
            text:
                'I am excited about the opportunity to contribute to your project and am confident that my technical expertise, creativity, and passion make me a valuable addition to your team. I look forward to working with you and helping to bring innovation to life.',
            ),
        LongTextBlockWidget(
            text:
                'Thank you for considering my application. Please feel free to contact me at [Your Email Address] or [Your Phone Number] if you would like to discuss my qualifications further. ',
            ),
        spaceUndernethSection
      ],
    );
  }
}
