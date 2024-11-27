// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/material.dart';

import '../widget/text_transform.dart';
import '../widget/title_widget.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    textRevealAnimation =
        Tween<double>(begin: 60.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.2, curve: Curves.easeOut)));

    textOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget _title(String text) => TitleWidget(
        padding: const EdgeInsets.only(bottom: 8),
        controller: controller,
        text: text,
        textOpacityAnimation: textOpacityAnimation,
        textRevealAnimation: textRevealAnimation,
      );

  Widget _button(
    String text,
  ) {
    bool enabled = false;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 50),
        backgroundColor: enabled ? AppColors.secondaryColor : Colors.transparent,
        side: enabled ? null : const BorderSide(color: AppColors.secondaryColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'CH',
          fontSize: 13,
          color: enabled ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title('Welcome to the application'),
            _title('of Lenny Kossyk for'),
            _title('Development of magnetic self-folding robots'),
            const SizedBox(
              height: 20,
            ),
            TextTransform(
              maxHeight: 100,
              controller: controller,
              textOpacityAnimation: textOpacityAnimation,
              //textRevealAnimation: textRevealAnimation,
              child: const Text(
                // TODO change Name
                'Dear Prof Mrs. Yang this website is my application',
                style: TextStyle(fontFamily: 'CH', fontSize: 13, color: Colors.white, fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _button('List of courses'),
                const SizedBox(
                  width: 25,
                ),
                _button('Motivation letter'),
                const SizedBox(
                  width: 25,
                ),
                _button('Curriculum vitae'),
                const SizedBox(
                  width: 25,
                ),
                _button('Transcript of records'),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
