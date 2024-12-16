// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/common/widget/bottom_line.dart';
import 'package:flutter/material.dart';

import '../../common/constant/spaceing.dart';
import '../../common/widget/long_text_block.dart';
import '../../common/widget/subtitle_widget.dart';
import '../../common/widget/title_widget.dart';

class CurriculumVitae extends StatefulWidget {
  const CurriculumVitae({super.key});

  @override
  State<CurriculumVitae> createState() => _CurriculumVitaeState();
}

class _CurriculumVitaeState extends State<CurriculumVitae> {
  Widget _title(String text) => TitleWidget(
    padding: const EdgeInsets.only(bottom: 25.0),
    text: text,
  );

  Widget _subtitle(String text) => SubtitleWidget(
    text: text,
  );

  Widget _longText(String text) => LongTextBlockWidget(text: text);

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
                    _title('Personal Data'),
                    _subtitle('Lenny Kossyk'),
                    _longText('Birth date: September 26, 2002\n'
                        'Address: Wilhelmshavenerstr. 12, 90425 Nuremberg, Germany\n'
                        'Email: lenkossyk@gmail.com\n'
                        'Phone: +49 159 06417160'),
                    spaceUnderneathSection,
                    _title('School education'),
                    _subtitle('General qualification for university entrance'),
                    _longText('Peter-Vischer-School Gymnasium, Nuremberg (2011 - 2021)\n'
                        'Abitur average: 2.4'),
                    spaceUnderneathSection,
                    _title('Higher education'),
                    _subtitle('Friedrich Alexander University \n(2022 - 2023):'),
                    _longText('Energy technology\n'),
                    _subtitle('Nuremberg Technical University \n(since 2023):'),
                    _longText('Energy process technology\n'),
                    spaceUnderneathSection,
                    _title('Previous professional experience'),
                    _subtitle('Internships Astrum IT \n(February - March 2022):'),
                    _longText('Developed a mobile Flutter application as an internship project\n'),
                    _subtitle('Working student at Astrum IT \n(April - August 2022):'),
                    _longText('Frontend implementation, documentation, and program maintenance\n'),
                    _subtitle('Working student City Hunters \n(October 2022 - May 2023):'),
                    _longText('Lead developer of a mobile Flutter application focused on geocaching\n'),
                    _subtitle('Working student Heitec Innovations \n(since April 2024):'),
                    _longText('Lead developer of a mobile Flutter application focused on energy data visualization\n'),
                    spaceUnderneathSection,
                    _title('List of achievements'),
                    _longText('1st sponsorship award from the Association for the History of the City of Nuremberg (2021):\n'
                        'For scientific seminar thesis on political views and social stratification based on student essays from 1946\n\n'
                        'Completion of the Existency Building Box Program with my startup,\n a government-funded initiative designed to teach startups essential skills for building a successful business\n\n'
                        'Deutschlandstipendium, a scholarship of the state of Germany (since 2024)\n'),
                    spaceUnderneathSection,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _card([
                            _title('IT knowledge'),
                            _longText('Fullstack \nApp Development\n(since 2021): \nFlutter (Dart)\n'
                                'Java\n'
                                'C#'),
                          ]),
                          rowSpacing,
                          _card([
                            _title('Language skills'),
                            _longText('English (C1)\n'
                                'German (native speaker)'),
                          ]),
                          rowSpacing,
                          _card([
                            _title('Interests'),
                            _longText('Cooking\n'
                                'Handball\n'
                                'Volleyball\n'
                                'Windsurfing\n'
                                'Gardening\n'
                                'Philosophy\n'
                                'History'),
                          ])
                        ],
                      ),
                    ),
                    spaceUnderneathSection,
                  ])),
          BottomLine()
        ]);
  }

  Widget _card(List<Widget> list) {
    return Card(
      color: Colors.grey.shade600,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      ),
    );
  }
}

///
/// Capture replay Verfahren ?
/// Arrange Act Assert !!!
/// playwright, cyberes
///
