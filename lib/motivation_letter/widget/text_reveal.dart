// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextReveal extends ConsumerStatefulWidget {
  final double maxHeight;
  final Widget child;
  final AnimationController controller;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;

  const TextReveal(
      {super.key, required this.maxHeight, required this.child, required this.controller, this.textRevealAnimation, this.textOpacityAnimation});

  @override
  ConsumerState<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends ConsumerState<TextReveal> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;

  final listViewKey = GlobalKey();
  final animatedBoxKey = GlobalKey();

  @override
  void initState() {
    controller = widget.controller;

    textRevealAnimation =
        widget.textRevealAnimation ?? Tween<double>(begin: 100.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    textOpacityAnimation =
        widget.textOpacityAnimation ?? Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    super.initState();
  }

  static const enterAnimationMinHeight = 100.0;

  _updateAnimatedBoxEnterAnimation() {
    if (controller.status != AnimationStatus.dismissed) {
      return; // animation already in progress/finished
    }

    RenderObject? animatedBoxObject = animatedBoxKey.currentContext?.findRenderObject();
    if (animatedBoxObject == null) return;

    final listViewHeight = ref.read(listViewKeyProvider).paintBounds.height;
    print(listViewHeight);

    final animatedBoxVisible = (offset + enterAnimationMinHeight < listViewHeight);

    if (animatedBoxVisible) {
      // start animation
      controller.forward();
    }
  }

  late int offset = ref.read(offsetStateProvider);

  @override
  Widget build(BuildContext context) {
    offset = ref.watch(offsetStateProvider);

    _updateAnimatedBoxEnterAnimation();

    return AnimatedBuilder(
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
              ),
            ),
          );
        });
  }
}
