// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/text_reveal.dart';
import '../widget/title_widget.dart';

class MotivationSkills extends StatefulWidget {
  const MotivationSkills({super.key});

  @override
  State<MotivationSkills> createState() => _MotivationSkillsState();
}

class _MotivationSkillsState extends State<MotivationSkills> with SingleTickerProviderStateMixin {
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

    imageRevealAnimation =
        Tween<double>(begin: 500.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));

    textRevealAnimation =
        Tween<double>(begin: 70.0, end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.30, 0.60, curve: Curves.easeOut)));

    subTextOpacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.80, curve: Curves.easeOut)));

    transform = Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    subImageRevealAnimation =
        Tween<double>(begin: 0.0, end: 90.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.70, 1.0, curve: Curves.easeOut)));

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

  Widget _subtitle(String text) => TextReveal(
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

  Widget _subsubtitle(String text) => Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: TextReveal(
          maxHeight: 50,
          controller: controller,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'CH',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _longText(String text) => SlideTransition(
        position: transform,
        // opacity: subTextOpacityAnimation,
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'CH',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),
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
                _subsubtitle('Electrical Engineering:'),
                _longText(
                    ' I have a solid foundation in electrical engineering, having passed my electrical exam with distinction. In addition, I completed an electrical engineering course, further deepening my understanding of the field. '),
                _subsubtitle('Practical Experience with Arduino:'),
                _longText(
                    'In my free time, I have gained hands-on experience with Arduino by building an electric car, allowing me to explore the integration of hardware and software in creative projects.'),
                _subsubtitle('Proficiency in CAD Software:'),
                _longText(
                    'Through my university module, ‘Einführung in CAD’, I developed proficiency in NX Siemens and Fusion 360. These tools enable me to design complex systems efficiently.'),
                _subsubtitle('3D Animation with Blender:'),
                _longText(
                    'As a hobby, I use Blender to animate and visualize ideas. I find this to be an excellent way to communicate concepts visually, particularly for individuals who may struggle to grasp abstract technical descriptions or broad ideas. '),
                _subsubtitle('Full-Stack App Development: '),
                _longText(
                    'Over the past three years, I have been working as a full-stack app developer. Additionally, I co-founded a startup where I served as the lead developer for 1.5 years. This experience taught me the importance of independent problem-solving, effective teamwork, and meticulous project organization—skills that are invaluable for collaborative work. ')
              ],
            ),
          ),
        );
      },
    );
  }
}
