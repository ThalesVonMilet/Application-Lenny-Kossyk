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

class _LongTextBlockWidgetState extends State<LongTextBlockWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _controllerIsDisposed = false;

  late Animation<Offset> _transform;

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

    _transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.text),
      onVisibilityChanged: (visible) {
        if (_controllerIsDisposed) return;
        if (visible.visibleBounds == Rect.zero) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: SlideTransition(
          position: _transform,
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

  @override
  void dispose() {
    _controllerIsDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}
