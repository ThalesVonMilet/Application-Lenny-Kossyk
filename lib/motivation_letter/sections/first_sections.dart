// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/motivation_letter/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/button_widget.dart';
import '../widget/spaceing.dart';
import '../widget/text_transform.dart';
import '../widget/title_widget.dart';

class FirstSection extends ConsumerStatefulWidget {
  const FirstSection({super.key});

  @override
  ConsumerState<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends ConsumerState<FirstSection> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;

  late int _currentTabIndex = ref.read(tabStateProvider);

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

    textRevealAnimation =
        Tween<double>(begin: 60.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.2, curve: Curves.easeOut)));

    textOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentTabIndex = ref.watch(tabStateProvider);

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
            columnSpacing,
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
            columnSpacing,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _button('List of courses', 0),
                rowSpacing,
                _button('Motivation letter', 1),
                rowSpacing,
                _button('Curriculum vitae', 2),
                rowSpacing,
                _button('Transcript of records', 3),
              ],
            ),
            sectionSpacing
          ],
        ),
      ),
    );
  }

  Widget _title(String text) => TitleWidget(
        padding: const EdgeInsets.only(bottom: 8),
        controller: controller,
        text: text,
        textOpacityAnimation: textOpacityAnimation,
        textRevealAnimation: textRevealAnimation,
      );

  Widget _button(String text, int tabIndex) => ButtonWidget(
      text: text,
      enabled: _currentTabIndex == tabIndex,
      onPressed: () {
        ref.read(tabStateProvider.notifier).state = tabIndex;
      });
}
