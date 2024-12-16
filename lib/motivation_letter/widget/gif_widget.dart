import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifWidget extends StatefulWidget {
  const GifWidget(
      {super.key,
        required this.controller});

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
        // if duration and fps is null, original gif fps will be used.
        //fps: 30,
        //duration: const Duration(seconds: 3),
        autostart: Autostart.no,
        placeholder: (context) => const Text('Loading...'),
      ),
    );
  }
}
