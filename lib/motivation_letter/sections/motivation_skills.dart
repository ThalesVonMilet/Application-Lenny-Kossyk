// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/motivation_letter/widget/long_text_block.dart';
import 'package:crypto_ui_web/motivation_letter/widget/spaceing.dart';
import 'package:crypto_ui_web/motivation_letter/widget/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package imports:

import '../widget/title_widget.dart';

class MotivationSkills extends StatefulWidget {
  const MotivationSkills({super.key});

  @override
 State<MotivationSkills> createState() => _MotivationSkillsState();
}

class _MotivationSkillsState extends State<MotivationSkills> {
  Widget _title(String text) => TitleWidget(
        padding: const EdgeInsets.only(bottom: 12.0),
        text: text,
      );

  Widget _subtitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SubtitleWidget(
          text: text,
        ),
      );

  Widget _longText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: LongTextBlockWidget(text: text),
      );

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceAboveSection,
        _title('Why would I be a good fit for this project ?'),
        _longText('My diverse skill set and practical experience make me a strong candidate. For instance:'),
        SizedBox(height: 14,),
        _subtitle('Electrical Engineering:'),
        _longText(
            'I have a solid foundation in electrical engineering, having passed my electrical exam with distinction. In addition, I completed an electrical engineering course, further deepening my understanding of the field.'),
        _subtitle('Practical Experience with Arduino:'),
        _longText(
            'In my free time, I have gained hands-on experience with Arduino by building an electric car, allowing me to explore the integration of hardware and software in creative projects.'),
        _subtitle('Proficiency in CAD Software:'),
        _longText(
            'Through my university module, “Introduction to CAD”, I developed proficiency in NX Siemens and Fusion 360. These tools enable me to design complex systems efficiently.'),
        _subtitle('3D Animation with Blender:'),
        _longText(
            'As a hobby, I use Blender to animate and visualize ideas. I find this to be an excellent way to communicate concepts visually, particularly for individuals who may struggle to grasp abstract technical descriptions or broad ideas.'),
        _subtitle('Software Developer:'),
        _longText(
            'Over the past three years, I have worked as a full-stack app developer and co-founded a startup, where I led the development efforts for 1.5 years. This experience has enhanced my ability to solve problems independently, collaborate effectively within teams, and manage projects with precision-skills that are essential for success in any collaborative environment.'),
        spaceUndernethSection,
      ],
    );
  }
}
