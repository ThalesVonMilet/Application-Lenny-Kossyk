// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gif/gif.dart';

// Project imports:
import 'package:crypto_ui_web/motivation_letter/sections/bottom_line.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_future.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_introduction.dart';
import 'package:crypto_ui_web/motivation_letter/sections/motivation_skills.dart';
import '../common/widget/gif_widget.dart';
import '../common/widget/spaceing.dart';

class MotivationLetter extends StatefulWidget {
  const MotivationLetter({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
 State<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends State<MotivationLetter>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late GifController _gifController;

  @override
  void initState() {
    _scrollController = widget.scrollController;
    _gifController = GifController(vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        _gifController.value = 0;
      } else {
        double value =
            (_gifController.upperBound - _gifController.lowerBound) *
                    _scrollController.position.pixels/
                    _scrollController.position.maxScrollExtent;

        _gifController.value = value.abs();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
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
          columnSpacing,
          GifWidget(controller: _gifController),
          spaceUndernethSection,
          spaceUndernethSection,
          const BottomLine(),
        ]));
  }
}
