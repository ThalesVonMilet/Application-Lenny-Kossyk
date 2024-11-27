// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/sections/bottom_line.dart';
import 'package:crypto_ui_web/motivation_letter/sections/first_sections.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_future.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_introduction.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_skills.dart';
import 'package:crypto_ui_web/motivation_letter/widget/gif_widget.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';

// Project imports:
import '../bloc/screen_offset.dart';
import 'controller.dart';

class MotivationLetter extends StatefulWidget {
  const MotivationLetter({super.key});

  @override
  State<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends State<MotivationLetter> with TickerProviderStateMixin {
  late GifController _controller;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    motivationScrollControllerProvider = Provider<ScrollController>((ref) => controller);

    controller.addListener(() {
      _controller.value = (_controller.upperBound - _controller.lowerBound) * controller.position.pixels / controller.position.maxScrollExtent;
      (MediaQuery.of(context).size.height + controller.position.pixels);
      context.read<DisplayOffset>().changeDisplayOffset((MediaQuery.of(context).size.height + controller.position.pixels).toInt());
    });

    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(controller: controller, children: [
      const FirstSection(),
      GifWidget(controller: _controller),
      const MotivationIntroduction(),
      GifWidget(controller: _controller),
      const MotivationSkills(),
      GifWidget(controller: _controller),
      const MotivationFuture(),
      const BottomLine(),
      /*Flexible(
        child: SizedBox(
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
      )*/
    ]);
  }
}
