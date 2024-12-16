// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../common/widget/long_text_block.dart';
import '../../common/widget/subtitle_widget.dart';
import '../../common/widget/title_widget.dart';
import '../common/widget/heading_widget.dart';

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
        padding: const EdgeInsets.only(bottom: 0.0),
        text: text,
      );

  Widget _subtitle(String text) => Padding(
        padding: EdgeInsets.only(left: 40, bottom: 26, top: 70.0),
        child: SubtitleWidget(
          text: text,
        ),
      );

  _heading(String text) => Padding(
        padding: const EdgeInsets.only(left: 65.0, bottom: 16),
        child: HeadingWidget(text: text),
      );

  Widget _longText(String text) => Padding(padding: EdgeInsets.only(left: 85), child: LongTextBlockWidget(text: text));

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _title('List of courses'),
            Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _subtitle('Electrical Engineering'),
                  _heading('Topics:'),
                  _longText('- Physical principles of electrical engineering\n'
                      '- DC and AC circuits\n'
                      '- Three-phase systems, transformers, and electric motors\n'
                      '- Exercises related to the topics above'),
                  SizedBox(height: 22),
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
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Use instruments for voltage, current, resistance\n'
                      '- Record properties of electric motors and develop drives\n'
                      '- Implement basic circuits with operational amplifiers'),
                  _subtitle('Technical and Scientific Programming'),
                  _heading('Topics:'),
                  _longText('- Python syntax and subroutines\n'
                      '- Numerical library functions\n'
                      '- Engineering applications with Python'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Create software programs using Python\n'
                      '- Apply numerical methods to solve engineering problems\n'
                      '- Simulate technical systems using Python'),
                  _subtitle('Introduction to CAD'),
                  _heading('Topics:'),
                  _longText('- Industrial CAD applications\n'
                      '- Siemens NX for 3D modeling and technical drawings'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Use CAD software for design and technical drawings\n'
                      '- Create apparatus components and communicate technical ideas'),
                  _subtitle('Energy Storage'),
                  _heading('Topics:'),
                  _longText('- Fundamentals of energy storage\n'
                      '- Chemical, thermal, mechanical, and physical storage systems'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Understand classifications of energy storage\n'
                      '- Evaluate storage requirements\n'
                      '- Design storage solutions for applications'),
                  _subtitle('Materials Science'),
                  _heading('Topics:'),
                  _longText('- Atomic structures, bonding, and periodic table\n'
                      '- Properties of metals, ceramics, and polymers\n'
                      '- Corrosion and hydrogen compatibility'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Interpret the periodic table and material behaviors\n'
                      '- Select materials for energy and process engineering equipment'),
                  _subtitle('Measurement Technology'),
                  _heading('Topics:'),
                  _longText('- Sensors, signal transmission, and measurement errors'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Understand measurement systems and methods\n'
                      '- Analyze and interpret measurement results'),
                  _subtitle('Control Engineering'),
                  _heading('Topics:'),
                  _longText('- Control systems modeling\n'
                      '- Frequency domain analysis\n'
                      '- Controller design and automation devices'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Apply Laplace transformation for LTI systems\n'
                      '- Assess stability and configure control devices'),
                  _subtitle('Engineering Mechanics'),
                  _heading('Topics:'),
                  _longText('- Force systems, static equilibrium, and vibrations'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Apply Newton’s principles to mechanics problems\n'
                      '- Calculate stress and stability for mechanical systems'),
                  _subtitle('Strength of Materials'),
                  _heading('Topics:'),
                  _longText('- Stress types (tensile, compressive, bending, torsion)\n'
                      '- Stability and failure hypotheses'),
                  SizedBox(height: 22),
                  _heading('Learning Objectives:'),
                  _longText('- Design components using strength-based methods\n'
                      '- Analyze material behavior under different forces'),
                  SizedBox(
                    height: 120,
                  ),
                ])
            //BottomLine(),
          ],
        ));
  }
}

///
/// Capture replay Verfahren ?
/// Arrange Act Assert !!!
/// playwright, cyberes
///


