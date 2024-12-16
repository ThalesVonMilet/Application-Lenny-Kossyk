// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gif/gif.dart';

// Project imports:
import 'package:crypto_ui_web/common/widget/bottom_line.dart';
import '../../common/constant/spaceing.dart';
import '../../common/widget/gif_widget.dart';
import '../../common/widget/long_text_block.dart';
import '../../common/widget/subtitle_widget.dart';
import '../../common/widget/title_widget.dart';

class MotivationLetter extends StatefulWidget {
  const MotivationLetter({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<MotivationLetter> createState() => _MotivationLetterState();
}

class _MotivationLetterState extends State<MotivationLetter> with TickerProviderStateMixin {
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
            (_gifController.upperBound - _gifController.lowerBound) * _scrollController.position.pixels / _scrollController.position.maxScrollExtent;

        _gifController.value = value.abs();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  spaceAboveSection,
                  TitleWidget(
                    padding: EdgeInsets.only(bottom: 26),
                    text: 'What motivates me',
                  ),
                  LongTextBlockWidget(
                    text:
                        'From an early stage in life, even before the age of 15, I aspired to pursue a path rooted in innovation and engineering. I had the desire to create something entirely new that had not existed until I brought it to life. This passion has shaped my goals in life and is the reason I chose to study Energy Process Engineering. This field not only offers various opportunities but also plays a key role in tackling some of the world\'s most urgent challenges, especially in advancing the transition to sustainable solutions.\n'
                        '\n'
                        'My enthusiasm for sciences stems from their ability to turn ideas into impactful realities. For me, engineering is the ideal path to create meaningful changes in our society —combining creativity, analytical thinking, and practical application to improve lives and push the boundaries of what is possible. I think a perfect project, that exactly shows what I aspire, is your innovation on folding robots. Their compact, self-assembling design makes them ideal for space missions, where space and weight efficiency are critical. But not only that, they could be used for underwater research or in general for tough environments where current robots fail.',
                  ),
                  spaceUndernethSection,
                  GifWidget(controller: _gifController),
                  spaceAboveSection,
                  _title('Why would I be a good fit for this project ?'),
                  _longText('My diverse skill set and practical experience make me a strong candidate. For instance:'),
                  SizedBox(
                    height: 14,
                  ),
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
                  GifWidget(controller: _gifController),
                  const SizedBox(
                    height: 10,
                  ),
                  TitleWidget(text: 'My plans for the future'),
                  const SizedBox(
                    height: 30,
                  ),
                  LongTextBlockWidget(
                    text:
                        'Looking ahead, I am interested in working on emerging technologies such as hydrogen systems, advanced batteries, robotics, or other innovative fields. To achieve this I need to develop the skills needed to design and build such solutions. I view this internship as a great opportunity to further these skills while contributing to your project.\n',
                  ),
                  LongTextBlockWidget(
                    text:
                        'I am excited about the opportunity to contribute to your project and am confident that my technical expertise, creativity, and passion make me a valuable addition to your team. I am looking forward to working with you and helping to bring innovation to life.\n',
                  ),
                  LongTextBlockWidget(
                      text:
                          'Thank you for considering my application. I would be happy to discuss my qualifications further. Please feel free to reach out to me at lenkossyk@gmail.com or +49 159 06417160.\n'),
                  LongTextBlockWidget(
                      text: 'Sincerely,\n\n'
                          'Lenny Kossyk'),
                  spaceUndernethSection,
                  GifWidget(controller: _gifController),
                  spaceUndernethSection,
                ])),
        const BottomLine()
      ],
    );
  }

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
}
