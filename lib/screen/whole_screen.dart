import 'package:crypto_ui_web/screen/sections/first_sections.dart';
import 'package:crypto_ui_web/screen/sections/forth_section.dart';
import 'package:crypto_ui_web/screen/sections/third_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

import '../bloc/screen_offset.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen>
    with TickerProviderStateMixin {
  late GifController _controller;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      _controller.value = (_controller.upperBound - _controller.lowerBound) *
          controller.position.pixels /
          controller.position.maxScrollExtent;
      (MediaQuery.of(context).size.height + controller.position.pixels);
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt());
    });

    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        FirstSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        //FirstSection(),
        //SecondScreen(),
        ThirdSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        ForthSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        /*SizedBox(
          height: 100.0,
        ),
        ForthSection(),
        SizedBox(
          height: 50.0,
        ),
        FifthSection(),
        SizedBox(
          height: 50.0,
        ),
        SeventhSection(),
        SizedBox(
          height: 100.0,
        ),
        EighthSection(),
        SizedBox(
          height: 100.0,
        ),
        SixthSection(),
        SizedBox(
          height: 100.0,
        ),
        NinthSection(),*/
      ],
    );
  }
}
