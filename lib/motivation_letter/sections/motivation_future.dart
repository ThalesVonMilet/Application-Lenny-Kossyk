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

class _MotivationFutureState extends State<MotivationFuture> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> planAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;
  late Animation<Offset> transform;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    imageRevealAnimation =
        Tween<double>(begin: 500.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation =
        Tween<double>(begin: 70.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    planAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    offsetImage = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation =
        Tween<double>(begin: 0.0, end: 90.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

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
        TitleWidget(controller: controller, text: 'For the future'),
        /*TextReveal(
              maxHeight: 50,
              controller: controller,
              child: const Text(
                'of Your Choice',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'CH',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),*/
        const SizedBox(
          height: 30,
        ),
        LongTextBlockWidget(
            text:
                'For the future I hope to gather as much knowledge as possible. Especially in learning how to think abstractly, where this internship will for certain assist me at. In the long run I want to do something better, how I will achieve this I don’t know now but I want to create my own Company one day. ',
            transform: transform),
        LongTextBlockWidget(
            text:
                'I am excited about the opportunity to contribute to your project and am confident that my technical expertise, creativity, and passion make me a valuable addition to your team. I look forward to working with you and helping to bring innovation to life.',
            transform: transform),
        LongTextBlockWidget(
            text:
                'Thank you for considering my application. Please feel free to contact me at [Your Email Address] or [Your Phone Number] if you would like to discuss my qualifications further. ',
            transform: transform),
        spaceUndernethSection
      ],
    );
  }
}
