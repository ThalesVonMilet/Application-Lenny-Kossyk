// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crypto_ui_web/constant/color.dart';

class BottomLine extends StatefulWidget {
  const BottomLine({super.key});

  @override
  State<BottomLine> createState() => _BottomLineState();
}

class _BottomLineState extends State<BottomLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/Frame 19.png',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '',//'Lorem ipsum dolor sit amet consectetur. \nFusce nisl lacus elementum neque.',
                      style: TextStyle(
                        fontFamily: 'CH',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Column(
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
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
