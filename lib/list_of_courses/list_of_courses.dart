// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../motivation_letter/widget/long_text_block.dart';
import '../motivation_letter/widget/subtitle_widget.dart';
import '../motivation_letter/widget/title_widget.dart';

class ListOfCourses extends ConsumerStatefulWidget {
  const ListOfCourses({super.key});

  @override
  ConsumerState<ListOfCourses> createState() => _CurriculumVitaeState();
}

class _CurriculumVitaeState extends ConsumerState<ListOfCourses> with TickerProviderStateMixin {
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

  Widget _subtitle(String text) => Padding(
    padding: EdgeInsets.only(left: 20),
    child: SubtitleWidget(
          controller: controller,
          text: text,
        ),
  );

  Widget _longText(String text) => Padding(
      padding: EdgeInsets.only(left: 40),
      child: LongTextBlockWidget(text: text, transform: transform));

  _heading(String text) => Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: HeadingWidget(text: text, transform: transform),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _title('Courses Overview'),
            SizedBox(height: 25),
            _subtitle('Electrical Engineering'),
            _heading('Topics:'),
            _longText('- Physical principles of electrical engineering\n'
                '- DC and AC circuits\n'
                '- Three-phase systems, transformers, and electric motors\n'
                '- Exercises related to the topics above'),
            _heading('Learning Objectives:'),
            _longText('- Analyze and calculate DC and AC circuits\n'
                '- Apply principles of electrical power supply and drive technology\n'
                '- Design basic electrical drives'),
            _subtitle('Electrical Engineering Lab'),
            _heading('Topics:'),
            _longText('- Basics of electrical measurement technology\n'
                '- Direct and alternating current circuits\n'
                '- Electric drive (e.g., DC motor)\n'
                '- Simple electronic circuits (rectifiers, operational amplifiers)'),
            _heading('Learning Objectives:'),
            _longText('- Use instruments for voltage, current, resistance\n'
                '- Record properties of electric motors and develop drives\n'
                '- Implement basic circuits with operational amplifiers'),
            _subtitle('Technical and Scientific Programming'),
            _heading('Topics:'),
            _longText('- Python syntax and subroutines\n'
                '- Numerical library functions\n'
                '- Engineering applications with Python'),
            _heading('Learning Objectives:'),
            _longText('- Create software programs using Python\n'
                '- Apply numerical methods to solve engineering problems\n'
                '- Simulate technical systems using Python'),
            _subtitle('Introduction to CAD'),
            _heading('Topics:'),
            _longText('- Industrial CAD applications\n'
                '- Siemens NX for 3D modeling and technical drawings'),
            _heading('Learning Objectives:'),
            _longText('- Use CAD software for design and technical drawings\n'
                '- Create apparatus components and communicate technical ideas'),
            _subtitle('Energy Storage'),
            _heading('Topics:'),
            _longText('- Fundamentals of energy storage\n'
                '- Chemical, thermal, mechanical, and physical storage systems'),
            _heading('Learning Objectives:'),
            _longText('- Understand classifications of energy storage\n'
                '- Evaluate storage requirements\n'
                '- Design storage solutions for applications'),
            _subtitle('Materials Science'),
            _heading('Topics:'),
            _longText('- Atomic structures, bonding, and periodic table\n'
                '- Properties of metals, ceramics, and polymers\n'
                '- Corrosion and hydrogen compatibility'),
            _heading('Learning Objectives:'),
            _longText('- Interpret the periodic table and material behaviors\n'
                '- Select materials for energy and process engineering equipment'),
            _subtitle('Measurement Technology'),
            _heading('Topics:'),
            _longText('- Sensors, signal transmission, and measurement errors'),
            _heading('Learning Objectives:'),
            _longText('- Understand measurement systems and methods\n'
                '- Analyze and interpret measurement results'),
            _subtitle('Control Engineering'),
            _heading('Topics:'),
            _longText('- Control systems modeling\n'
                '- Frequency domain analysis\n'
                '- Controller design and automation devices'),
            _heading('Learning Objectives:'),
            _longText('- Apply Laplace transformation for LTI systems\n'
                '- Assess stability and configure control devices'),
            _subtitle('Engineering Mechanics'),
            _heading('Topics:'),
            _longText('- Force systems, static equilibrium, and vibrations'),
            _heading('Learning Objectives:'),
            _longText('- Apply Newton’s principles to mechanics problems\n'
                '- Calculate stress and stability for mechanical systems'),
            _subtitle('Strength of Materials'),
            _heading('Topics:'),
            _longText('- Stress types (tensile, compressive, bending, torsion)\n'
                '- Stability and failure hypotheses'),
            _heading('Learning Objectives:'),
            _longText('- Design components using strength-based methods\n'
                '- Analyze material behavior under different forces'),
          ],
        ));
  }
}

///
/// Capture replay Verfahren ?
/// Arrange Act Assert !!!
/// playwright, cyberes
///

class HeadingWidget extends StatefulWidget {
  const HeadingWidget({
    super.key,
    required this.text,
    required this.transform,
  });

  final Animation<Offset> transform;
  final String text;

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: SlideTransition(
        position: widget.transform,
        // opacity: subTextOpacityAnimation,
        child: Text(
          widget.text,
          style: const TextStyle(
            fontFamily: 'CH',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
