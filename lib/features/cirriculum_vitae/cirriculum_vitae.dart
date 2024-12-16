// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_ui_web/common/widget/bottom_line.dart';
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
                    spaceUndernethSection,
                    _title('School education'),
                    _subtitle('General qualification for university entrance'),
                    _longText('Peter-Vischer-Schule Gymnasium, Nuremberg (2011 - 2021)\n'
                        'Abitur average: 2.4'),
                    spaceUndernethSection,
                    _title('Higher education'),
                    _subtitle('Current Studies'),
                    _longText('Nuremberg Technical University (since 2023): Energy process technology\n'
                        'Friedrich Alexander University (2022 - 2023): Energy technology'),
                    spaceUndernethSection,
                    _title('Previous professional experience'),
                    _subtitle('Working student positions'),
                    _longText('City Hunters (October 2022 - May 2023): Lead developer of a mobile Flutter application focused on geocaching\n'
                        'Heitec Innovations (since April 2024): Lead developer of a mobile Flutter application focused on energy data visualization'),
                    spaceUndernethSection,
                    _subtitle('Internships'),
                    _longText('Astrum IT (February - March 2022): Developed a mobile Flutter application as an internship project\n'
                        'Working student at Astrum IT (April - August 2022): Frontend implementation, documentation, and program maintenance'),
                    spaceUndernethSection,
                    _title('IT knowledge'),
                    _longText('Fullstack App Development (since 2021): Flutter (Dart)\n'
                        'Java\n'
                        'C#'),
                    spaceUndernethSection,
                    _title('Language skills'),
                    _longText('English (C1)\n'
                        'German (native speaker)'),
                    spaceUndernethSection,
                    _title('Interests'),
                    _longText('Cooking\n'
                        'Handball\n'
                        'Volleyball\n'
                        'Windsurfing\n'
                        'Gardening\n'
                        'Philosophy\n'
                        'History'),
                    spaceUndernethSection,
                    _title('Educational achievements'),
                    _longText('1st sponsorship award from the Association for the History of the City of Nuremberg (2021):\n'
                        'For scientific seminar thesis on political views and social stratification based on student essays from 1946\n\n'
                        'Deutschlandstipendium (since 2024)'),
                    spaceUndernethSection,
                  ])),
          BottomLine()
        ]);
  }
}

///
/// Capture replay Verfahren ?
/// Arrange Act Assert !!!
/// playwright, cyberes
///