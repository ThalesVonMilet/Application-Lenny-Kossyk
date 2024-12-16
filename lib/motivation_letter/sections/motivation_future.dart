// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../common/widget/long_text_block.dart';
import '../../common/widget/spaceing.dart';
import '../../common/widget/title_widget.dart';

// Package imports:


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
        TitleWidget(text: 'My plans for the future'),
        const SizedBox(
          height: 30,
        ),
        LongTextBlockWidget(
          text:
              'Looking ahead, I am interested in working on emerging technologies such as hydrogen systems, advanced batteries, robotics, or other innovative fields. To achieve this I need to develop the skills needed to design and build such solutions. I view this internship as a great opportunity to further these skills while contributing to your project.\n',
        ),
        LongTextBlockWidget(
          text:
              'I am excited about the opportunity to contribute to your project and am confident that my technical expertise, creativity, and passion make me a valuable addition to your team. I am looking forward to working with you and helping to bring innovation to life.\n',
        ),
        LongTextBlockWidget(
            text:
                'Thank you for considering my application. I would be happy to discuss my qualifications further. Please feel free to reach out to me at lenkossyk@gmail.com or +49 159 06417160.\n'),
        LongTextBlockWidget(
            text: 'Sincerely,\n\n'
                'Lenny Kossyk'),
        spaceUndernethSection
      ],
    );
  }
}
