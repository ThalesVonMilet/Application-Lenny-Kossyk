// Flutter imports:
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import '../constant/color.dart';
import '../constant/spaceing.dart';
import 'button_widget.dart';

class BottomLine extends StatefulWidget {
  const BottomLine({super.key});

  @override
  State<BottomLine> createState() => _BottomLineState();
}

class _BottomLineState extends State<BottomLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      child: Column(
        children: [
          columnSpacing,
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonWidget(text: "Visit my LinkedIn",onPressed: () {
                _launchUrl();
              },),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Me',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+49 159 06417160',
                        style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'lenkossyk@gmail.com',
                        style: TextStyle(
                          fontFamily: 'CH',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          columnSpacing
        ],
      ),
    );
  }

  final Uri _url = Uri.parse('https://www.linkedin.com/in/lenny-kossyk-2a2033234?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
    }
  }
}
