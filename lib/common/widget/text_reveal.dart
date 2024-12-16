// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TextReveal extends ConsumerStatefulWidget {
  final double maxHeight;
  final Widget child;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;

  const TextReveal({super.key, required this.maxHeight, required this.child, this.textRevealAnimation, this.textOpacityAnimation});

  @override
  ConsumerState<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends ConsumerState<TextReveal> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;

  final listViewKey = GlobalKey();
  final animatedBoxKey = GlobalKey();

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

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: ValueKey(controller.toString()),
        onVisibilityChanged: (visible) {
          if (visible.visibleBounds == Rect.zero) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: AnimatedBuilder(
            animation: textRevealAnimation,
            builder: (context, child) {
              return LimitedBox(
                  maxHeight: widget.maxHeight,
                  child: Container(
                      key: animatedBoxKey,
                      padding: EdgeInsets.only(top: textRevealAnimation.value),
                      child: FadeTransition(
                        opacity: textOpacityAnimation,
                        child: widget.child,
                      )));
            }));
  }
}
