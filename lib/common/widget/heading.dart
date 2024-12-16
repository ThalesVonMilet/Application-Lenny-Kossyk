// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:crypto_ui_web/common/controller.dart';
import '../constant/spaceing.dart';
import 'button_widget.dart';
import 'text_transform.dart';
import 'title_widget.dart';

class Heading extends ConsumerStatefulWidget {
  const Heading({super.key});

  @override
  ConsumerState<Heading> createState() => _FirstSectionState();
}

class _FirstSectionState extends ConsumerState<Heading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textOpacityAnimation;

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

    return Flex(direction: Axis.vertical, crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 120,
      ),
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
          'Dear Dr. Xue Chen this website is my application',
          style: TextStyle(fontFamily: 'CH', fontSize: 13, color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ),
      /**/
      columnSpacing,
      columnSpacing,
      Flex(
        direction: Axis.horizontal,
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
    ]);
  }

  Widget _title(String text) => TitleWidget(
        padding: const EdgeInsets.only(bottom: 8),
        text: text,
      );

  Widget _button(String text, int tabIndex) => ButtonWidget(
      text: text,
      enabled: _currentTabIndex == tabIndex,
      onPressed: () {
        ref.read(tabStateProvider.notifier).state = tabIndex;
      });
}
