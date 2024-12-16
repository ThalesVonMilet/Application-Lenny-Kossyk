// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:visibility_detector/visibility_detector.dart';

class LongTextBlockWidget extends StatefulWidget {
  const LongTextBlockWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<LongTextBlockWidget> createState() => _LongTextBlockWidgetState();
}

class _LongTextBlockWidgetState extends State<LongTextBlockWidget> with TickerProviderStateMixin {
  late AnimationController controller;
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

    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    controller.stop();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.text),
      onVisibilityChanged: (visible) {
        if (visible.visibleBounds == Rect.zero) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      child: SlideTransition(
          position: transform,
          // opacity: subTextOpacityAnimation,
          child: Text(widget.text,
              style: const TextStyle(
                fontFamily: 'CH',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w200,
              ))),
    );
  }
}
