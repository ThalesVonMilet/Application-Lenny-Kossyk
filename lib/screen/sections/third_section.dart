import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;
  late Animation<Offset> offsetImage;
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
    offsetImage =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
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
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextReveal(
                  maxHeight: 50,
                  controller: controller,
                  child: const Text(
                    'What motivates me',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'CH',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                SlideTransition(
                  position: transform,
                  // opacity: subTextOpacityAnimation,
                  child: const Text(
                    'From an early age, even before I turned 15, I wanted to do something with innovation—the desire to create something transformative, something that did not exist before I worked on it. This passion has shaped my goals and is the reason I chose to study Energy Process Engineering. This field is not only rich with opportunities but also holds the key to addressing some of the world’s most pressing challenges, particularly in the transition toward sustainable solutions.My love for natural sciences, especially engineering, stems from their ability to turn ideas into impactful realities. For me, engineering is the perfect way to bring about meaningful change—merging creativity, problem-solving, and practical application to improve lives and push the boundaries of what is possible. A particularly fascinating example that inspires me is the concept of foldable robots. Their compact, self-assembling design makes them ideal for space missions, where space and weight efficiency are critical. But not only that, they could be used for underwater research or in general for tough environments where current robots fail. ',
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
