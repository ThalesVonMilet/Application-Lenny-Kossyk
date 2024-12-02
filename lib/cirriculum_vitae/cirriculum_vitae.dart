// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';

// Project imports:
import '../bloc/screen_offset.dart';
import '../motivation_letter/controller.dart';
import '../motivation_letter/widget/long_text_block.dart';
import '../motivation_letter/widget/subtitle_widget.dart';
import '../motivation_letter/widget/title_widget.dart';

class CurriculumVitae extends ConsumerStatefulWidget {
  const CurriculumVitae({super.key});

  @override
  ConsumerState<CurriculumVitae> createState() => _CurriculumVitaeState();
}

class _CurriculumVitaeState extends ConsumerState<CurriculumVitae> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> transform;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget _title(String text) => TitleWidget(
    padding: const EdgeInsets.only(bottom: 25.0),
    controller: controller,
    text: text,
  );

  Widget _subtitle(String text) => SubtitleWidget(
    controller: controller,
    text: text,
  );

  Widget _longText(String text) => LongTextBlockWidget(text: text, transform: transform);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
      buildWhen: (previous, current) {
        if (current.scrollOffsetValue > 1200 || controller.isAnimating) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _title('School education'),
              _subtitle(
                  'General qualification for university entrance'),
              _longText('Peter Vischer School Gymnasium, Nuremberg Abitur average: 2.4'),
              spaceUndernethSection,
            ],
          ),
        );
      },
    );
  }
}
