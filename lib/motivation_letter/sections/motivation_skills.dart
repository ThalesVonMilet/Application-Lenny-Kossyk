// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/text_reveal.dart';

class MotivationSkills extends StatefulWidget {
  const MotivationSkills({super.key});

  @override
  State<MotivationSkills> createState() => _MotivationSkillsState();
}

class _MotivationSkillsState extends State<MotivationSkills>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;
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

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));

    transform =
        Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget _title(String text) => TextReveal(
        maxHeight: 50,
        controller: controller,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'CH',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

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
        if (state.scrollOffsetValue > 1200) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _title('Why would I be a good fit for this project ?'),
                /*TextReveal(
                  maxHeight: 50,
                  controller: controller,
                  child: const Text(
                    'of Your Choice',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'CH',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 30,
                ),
                TextReveal(
                  maxHeight: 50,
                  controller: controller,
                  child: const Text(
                    'Electrical Engineering: ',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'CH',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SlideTransition(
                  position: transform,
                  // opacity: subTextOpacityAnimation,
                  child: const Text(
                    ' I have a solid foundation in electrical engineering, having passed my electrical exam with distinction. In addition, I completed an electrical engineering course, further deepening my understanding of the field. ',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                /*TextReveal(
                  maxHeight: 50,
                  controller: controller,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: AppColors.scaffoldColor,
                      side: const BorderSide(
                        width: 0.5,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Learn More',
                      style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: AppColors.secondaryColor),
                    ),
                  ),
                )*/
              ],
            ),
          ),
        );
      },
    );
  }
}
