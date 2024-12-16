// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/motivation_letter/widget/long_text_block.dart';
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
import 'package:flutter/material.dart';

// Package imports:

import '../widget/title_widget.dart';

class MotivationIntroduction extends StatefulWidget {
  const MotivationIntroduction({super.key});

  @override
  State<MotivationIntroduction> createState() => _MotivationIntroductionState();
}

class _MotivationIntroductionState extends State<MotivationIntroduction> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceAboveSection,
        TitleWidget(
          padding: EdgeInsets.only(bottom: 26),
          text: 'What motivates me',
        ),
        LongTextBlockWidget(
          text:
              'From an early stage in life, even before the age of 15, I aspired to pursue a path rooted in innovation and engineering. I had the desire to create something entirely new that had not existed until I brought it to life. This passion has shaped my goals in life and is the reason I chose to study Energy Process Engineering. This field not only offers various opportunities but also plays a key role in tackling some of the world\'s most urgent challenges, especially in advancing the transition to sustainable solutions.\n'
              '\n'
              'My enthusiasm for sciences stems from their ability to turn ideas into impactful realities. For me, engineering is the ideal path to create meaningful changes in our society —combining creativity, analytical thinking, and practical application to improve lives and push the boundaries of what is possible. I think a perfect project, that exactly shows what I aspire, is your innovation on folding robots. Their compact, self-assembling design makes them ideal for space missions, where space and weight efficiency are critical. But not only that, they could be used for underwater research or in general for tough environments where current robots fail.',
        ),
        spaceUndernethSection
      ],
    );
  }
}
