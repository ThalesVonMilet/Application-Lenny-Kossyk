// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:gif/gif.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GifWidget extends StatefulWidget {
  const GifWidget({super.key, required this.controller});

  final GifController controller;

  @override
  State<GifWidget> createState() => _GifWidgetState();
}

class _GifWidgetState extends State<GifWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: double.infinity,
        child: Gif(
            fit: BoxFit.contain,
            image: const AssetImage("assets/images/origami.gif"),
            controller: widget.controller,
            autostart: Autostart.no,
            placeholder: (context) => Center(
                child: Container(
                    height: 100,
                    width: 100,
                    child: LoadingIndicator(
                      indicatorType: Indicator.squareSpin,
                      colors: const [Colors.white],
                    )))));
  }
}
