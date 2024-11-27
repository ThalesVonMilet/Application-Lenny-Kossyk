// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/sections/fifth_section.dart';
import 'package:crypto_ui_web/motivation_letter/sections/first_sections.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_skills.dart';
import 'package:crypto_ui_web/motivation_letter/sections/third_section.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

// Project imports:
import '../bloc/screen_offset.dart';

class MotivationLetter extends StatefulWidget {
  const MotivationLetter({super.key});

  @override
  State<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends State<MotivationLetter>
    with TickerProviderStateMixin {
  late GifController _controller;
  late ScrollController controller;
  late TabController _tabController;

  final ValueNotifier<int> _currentScreen = ValueNotifier<int>(0);
  final int _previousScreen = 0;

  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      _controller.value = (_controller.upperBound - _controller.lowerBound) *
          controller.position.pixels /
          controller.position.maxScrollExtent;
      (MediaQuery
          .of(context)
          .size
          .height + controller.position.pixels);
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery
              .of(context)
              .size
              .height + controller.position.pixels)
              .toInt());
    });
    _tabController = TabController(vsync: this, length: 4);

    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_tabController.index);
    return ListView(
      controller: controller,
      children: [
        FirstSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: const AssetImage("assets/images/lamp1.gif"),
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
        MotivationIntroduction(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: const AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        MotivationSkills(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: const AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        MotivationFuture(),
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
