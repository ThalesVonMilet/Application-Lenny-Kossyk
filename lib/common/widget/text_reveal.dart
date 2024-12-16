// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:visibility_detector/visibility_detector.dart';

class TextReveal extends StatefulWidget {
  final double maxHeight;
  final Widget child;

  const TextReveal({super.key, required this.maxHeight, required this.child});

  @override
  State<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextReveal> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _controllerIsDisposed = false;

  late Animation<double> _textRevealAnimation;
  late Animation<double> _textOpacityAnimation;

  final _animatedBoxKey = GlobalKey();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    _textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: ValueKey(_controller.toString()),
        onVisibilityChanged: (visible) {
          if (_controllerIsDisposed) return;
          if (visible.visibleBounds == Rect.zero) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: AnimatedBuilder(
            animation: _textRevealAnimation,
            builder: (context, child) {
              return LimitedBox(
                  maxHeight: widget.maxHeight,
                  child: Container(
                      key: _animatedBoxKey,
                      padding: EdgeInsets.only(top: _textRevealAnimation.value),
                      child: FadeTransition(
                        opacity: _textOpacityAnimation,
                        child: widget.child,
                      )));
            }));
  }

  @override
  void dispose() {
    _controllerIsDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}
