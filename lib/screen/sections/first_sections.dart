import 'package:crypto_ui_web/constant/color.dart';
import 'package:crypto_ui_web/screen/widget/text_transform.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../widget/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with TickerProviderStateMixin {
  late GifController _controller;

  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1700,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    textRevealAnimation = Tween<double>(begin: 60.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOut)));
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });

    _controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromARGB(255, 136,137,144)
      //bottom const BoxDecoration(color: Color.fromARGB(255,166,166,168)
      //AppColors.scaffoldColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextReveal(
              maxHeight: 100,
              controller: controller,
              textOpacityAnimation: textOpacityAnimation,
              textRevealAnimation: textRevealAnimation,
              child: const Text(
                'Welcome to the application',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            TextReveal(
              maxHeight: 100,
              controller: controller,
              textOpacityAnimation: textOpacityAnimation,
              textRevealAnimation: textRevealAnimation,
              child: const Text(
                'of Lenny Kossyk for',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            TextReveal(
              maxHeight: 100,
              controller: controller,
              textOpacityAnimation: textOpacityAnimation,
              textRevealAnimation: textRevealAnimation,
              child: const Text(
                'Development of magnetic self-folding robots',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextTransform(
              maxHeight: 100,
              controller: controller,
              textOpacityAnimation: textOpacityAnimation,
              //textRevealAnimation: textRevealAnimation,
              child: const Text(
                '',
                //'Lorem ipsum dolor sit amet consectetur. Duis morbi scelerisque lectus sodales rhoncus.',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: AppColors.secondaryColor),
                  child: const Text(
                    'List of courses',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                          color: AppColors.secondaryColor)),
                  child: const Text(
                    'Motivation letter',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 13,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: AppColors.secondaryColor),
                  child: const Text(
                    'Curriculum vitae',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: AppColors.secondaryColor),
                  child: const Text(
                    'Transcript of records',
                    style: TextStyle(
                      fontFamily: 'CH',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Gif(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/lamp1.gif"),
                  controller: _controller, // if duration and fps is null, original gif fps will be used.
                  //fps: 30,
                  //duration: const Duration(seconds: 3),
                  autostart: Autostart.no,
                  placeholder: (context) => const Text('Loading...'),
                  onFetchCompleted: () {
                    _controller.reset();
                    _controller.forward();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));

    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
    Future.delayed(const Duration(milliseconds: 375), () {
      if (_controller.isDismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            height: 920.0,
            width: double.infinity,
            child: Transform.scale(
              scale: 1,
              child: Image.asset(
                'assets/images/lamp_1_rb.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          /*Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _animation.value,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.scaffoldColor,
                    AppColors.secondaryColor,
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
          ),*/
        ],
      ),
      opacity: _animation,
    );
  }
}
