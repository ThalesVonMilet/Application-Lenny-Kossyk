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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';

// Project imports:
import '../cirriculum_vitae/cirriculum_vitae.dart';
import 'controller.dart';

class MotivationLetter extends ConsumerStatefulWidget {
  const MotivationLetter({super.key});

  @override
  ConsumerState<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends ConsumerState<MotivationLetter> with TickerProviderStateMixin {
  late GifController _gifController;
  late ScrollController _scrollController;

  GlobalKey listViewKey = GlobalKey();

  @override
  void initState() {
    _scrollController = ScrollController();
    motivationScrollControllerProvider = Provider<ScrollController>((ref) => _scrollController);
    listViewKeyProvider = Provider<GlobalKey>((ref) => listViewKey);


    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        _gifController.value = 0;
      } else {
        _gifController.value =
            (_gifController.upperBound - _gifController.lowerBound) * _scrollController.position.pixels / _scrollController.position.maxScrollExtent +
                0.33;
      }

      ref.read(offsetStateProvider.notifier).state = (MediaQuery.of(context).size.height + _scrollController.position.pixels).toInt();
    });

    _gifController = GifController(vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(key: listViewKey, controller: _scrollController, children: [
      Heading(),
      ...[
        [],
        [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Flex(direction: Axis.vertical, children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GifWidget(controller: _gifController),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: Colors.grey.shade400,
                        size: 35,
                      ),
                    )
                  ],
                ),
                const MotivationIntroduction(),
                GifWidget(controller: _gifController),
                const MotivationSkills(),
                GifWidget(controller: _gifController),
                const MotivationFuture(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GifWidget(controller: _gifController),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.grey.shade400,
                            size: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                spaceUndernethSection,
              ])),
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
        [CurriculumVitae()]
      ][ref.watch(tabStateProvider)],
    ]);
  }
}
