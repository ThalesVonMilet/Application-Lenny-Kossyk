// Flutter imports:
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
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

class _CurriculumVitaeState extends ConsumerState<ListOfCourses>
    with TickerProviderStateMixin {
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

    transform =
        Tween<Offset>(begin: const Offset(10, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

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

  Widget _longText(String text) =>
      LongTextBlockWidget(text: text, transform: transform);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_title('Courses Overview'),
            _subtitle('Electrical Engineering'),
            _longText(
                'Topics:\n'
                    '- Physical principles of electrical engineering\n'
                    '- DC and AC circuits\n'
                    '- Three-phase systems, transformers, and electric motors\n'
                    '- Exercises related to the topics above\n\n'
                    'Learning Objectives:\n'
                    '- Analyze and calculate DC and AC circuits\n'
                    '- Apply principles of electrical power supply and drive technology\n'
                    '- Design basic electrical drives'),
            spaceUndernethSection,

            _subtitle('Electrical Engineering Lab'),
            _longText(
                'Topics:\n'
                    '- Basics of electrical measurement technology\n'
                    '- Direct and alternating current circuits\n'
                    '- Electric drive (e.g., DC motor)\n'
                    '- Simple electronic circuits (rectifiers, operational amplifiers)\n\n'
                    'Learning Objectives:\n'
                    '- Use instruments for voltage, current, resistance\n'
                    '- Record properties of electric motors and develop drives\n'
                    '- Implement basic circuits with operational amplifiers'),
            spaceUndernethSection,

            _subtitle('Technical and Scientific Programming'),
            _longText(
                'Topics:\n'
                    '- Python syntax and subroutines\n'
                    '- Numerical library functions\n'
                    '- Engineering applications with Python\n\n'
                    'Learning Objectives:\n'
                    '- Create software programs using Python\n'
                    '- Apply numerical methods to solve engineering problems\n'
                    '- Simulate technical systems using Python'),
            spaceUndernethSection,

            _subtitle('Introduction to CAD'),
            _longText(
                'Topics:\n'
                    '- Industrial CAD applications\n'
                    '- Siemens NX for 3D modeling and technical drawings\n\n'
                    'Learning Objectives:\n'
                    '- Use CAD software for design and technical drawings\n'
                    '- Create apparatus components and communicate technical ideas'),
            spaceUndernethSection,

            _subtitle('Energy Storage'),
            _longText(
                'Topics:\n'
                    '- Fundamentals of energy storage\n'
                    '- Chemical, thermal, mechanical, and physical storage systems\n\n'
                    'Learning Objectives:\n'
                    '- Understand classifications of energy storage\n'
                    '- Evaluate storage requirements\n'
                    '- Design storage solutions for applications'),
            spaceUndernethSection,

            _subtitle('Materials Science'),
            _longText(
                'Topics:\n'
                    '- Atomic structures, bonding, and periodic table\n'
                    '- Properties of metals, ceramics, and polymers\n'
                    '- Corrosion and hydrogen compatibility\n\n'
                    'Learning Objectives:\n'
                    '- Interpret the periodic table and material behaviors\n'
                    '- Select materials for energy and process engineering equipment'),
            spaceUndernethSection,

            _subtitle('Measurement Technology'),
            _longText(
                'Topics:\n'
                    '- Sensors, signal transmission, and measurement errors\n\n'
                    'Learning Objectives:\n'
                    '- Understand measurement systems and methods\n'
                    '- Analyze and interpret measurement results'),
            spaceUndernethSection,

            _subtitle('Control Engineering'),
            _longText(
                'Topics:\n'
                    '- Control systems modeling\n'
                    '- Frequency domain analysis\n'
                    '- Controller design and automation devices\n\n'
                    'Learning Objectives:\n'
                    '- Apply Laplace transformation for LTI systems\n'
                    '- Assess stability and configure control devices'),
            spaceUndernethSection,

            _subtitle('Engineering Mechanics'),
            _longText(
                'Topics:\n'
                    '- Force systems, static equilibrium, and vibrations\n\n'
                    'Learning Objectives:\n'
                    '- Apply Newton’s principles to mechanics problems\n'
                    '- Calculate stress and stability for mechanical systems'),
            spaceUndernethSection,

            _subtitle('Strength of Materials'),
            _longText(
                'Topics:\n'
                    '- Stress types (tensile, compressive, bending, torsion)\n'
                    '- Stability and failure hypotheses\n\n'
                    'Learning Objectives:\n'
                    '- Design components using strength-based methods\n'
                    '- Analyze material behavior under different forces'),
            spaceUndernethSection,
          ],
        ));
  }
}

///
/// Capture replay Verfahren ?
/// Arrange Act Assert !!!
/// playwright, cyberes
///