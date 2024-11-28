// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/sections/bottom_line.dart';
import 'package:crypto_ui_web/motivation_letter/sections/heading.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_future.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_introduction.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_skills.dart';
import 'package:crypto_ui_web/motivation_letter/widget/gif_widget.dart';
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

// Project imports:
import '../bloc/screen_offset.dart';
import 'controller.dart';

class MotivationLetter extends ConsumerStatefulWidget {
  const MotivationLetter({super.key});

  @override
  ConsumerState<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends ConsumerState<MotivationLetter> with TickerProviderStateMixin {
  late GifController _gifController;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    motivationScrollControllerProvider = Provider<ScrollController>((ref) => controller);

    controller.addListener(() {
      _gifController.value =
          (_gifController.upperBound - _gifController.lowerBound) * controller.position.pixels / controller.position.maxScrollExtent;
      (MediaQuery.of(context).size.height + controller.position.pixels);
      context.read<DisplayOffset>().changeDisplayOffset((MediaQuery.of(context).size.height + controller.position.pixels).toInt());
    });

    _gifController = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
      child: ListView(controller: controller, children: [
        const Heading(),
        ...[
          [],
          [
            GifWidget(controller: _gifController),
            const MotivationIntroduction(),
            GifWidget(controller: _gifController),
            const MotivationSkills(),
            GifWidget(controller: _gifController),
            const MotivationFuture(),
            GifWidget(controller: _gifController),
            spaceUndernethSection,
            /*Container(
              height: 500,
              width: 500,
              child: const ModelViewer(
                src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                alt: 'A 3D model of an astronaut',
                ar: true,
                autoRotate: true,
                iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                disableZoom: true,
              ),
            ),*/
            const BottomLine(),
          ],
          [],
          []
        ][ref.watch(tabStateProvider)],
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
      ]),
    );
  }
}
