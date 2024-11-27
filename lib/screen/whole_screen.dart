import 'package:crypto_ui_web/screen/sections/fifth_section.dart';
import 'package:crypto_ui_web/screen/sections/first_sections.dart';
import 'package:crypto_ui_web/screen/sections/forth_section.dart';
import 'package:crypto_ui_web/screen/sections/third_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

import '../bloc/screen_offset.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen>
    with TickerProviderStateMixin {
  late GifController _controller;
  late ScrollController controller;
  late TabController _tabController;

  ValueNotifier<int> _currentScreen = ValueNotifier<int>(0);
  int _previousScreen = 0;

  @override
  void initState() {
    controller = ScrollController();

    controller.addListener(() {
      _controller.value = (_controller.upperBound - _controller.lowerBound) *
          controller.position.pixels /
          controller.position.maxScrollExtent;
      (MediaQuery
          .of(context)
          .size
          .height + controller.position.pixels);
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery
              .of(context)
              .size
              .height + controller.position.pixels)
              .toInt());
    });
    _tabController = TabController(vsync: this, length: 4);

    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_tabController.index);
    return ListView(
      controller: controller,
      children: [
        FirstSection(),
        FloatingActionButton(onPressed: (){
          _previousScreen = _currentScreen.value;
          _currentScreen.value = 0;
        }),
        FloatingActionButton(onPressed: (){
          _previousScreen = _currentScreen.value;
          _currentScreen.value = 2;
        }),
        /// Tab View
        ValueListenableBuilder<int>(
            valueListenable: _currentScreen,
            builder: (context, screen, child) {
              return Container(
                width: double.infinity,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 900),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    final inAnimation =
                    Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation);
                    final outAnimation =
                    Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation);

                    final Widget inTransition = ClipRect(
                      child: SlideTransition(
                        position: inAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(300.0),
                          child: child,
                        ),
                      ),
                    );

                    final Widget outTransition = ClipRect(
                      child: SlideTransition(
                        position: outAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: child,
                        ),
                      ),
                    );

                    //// Transition for two screens
                    //                    if (child.key == ValueKey<int>(1)) {
                    //                      print(_previousScreen);
                    ////                    if (_previousScreen < screen) {
                    //                      return ClipRect(
                    //                        child: SlideTransition(
                    //                          position: inAnimation,
                    //                          child: Padding(
                    //                            padding: const EdgeInsets.all(8.0),
                    //                            child: child,
                    //                          ),
                    //                        ),
                    //                      );
                    //                    } else {
                    //                      return ClipRect(
                    //                        child: SlideTransition(
                    //                          position: outAnimation,
                    //                          child: Padding(
                    //                            padding: const EdgeInsets.all(8.0),
                    //                            child: child,
                    //                          ),
                    //                        ),
                    //                      );
                    //                    }

                    //// Transition for three screens
                    if (child.key == ValueKey<int>(1)) {
                      if (_previousScreen == 0 || _previousScreen == 1 && screen != 2) return inTransition;
                      return outTransition;
                    } else if (child.key == ValueKey<int>(2)) {
                      return inTransition;
                    } else {
                      return outTransition;
                    }
                  },
                  child: _returnTab(screen),
                ),
              );
            }),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        //FirstSection(),
        //SecondScreen(),
        ThirdSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        ForthSection(),
        SizedBox(
          //height: 500,
          width: double.infinity,
          child: Gif(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lamp1.gif"),
            controller: _controller,
            // if duration and fps is null, original gif fps will be used.
            //fps: 30,
            //duration: const Duration(seconds: 3),
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
          ),
        ),
        FifthSection()
        /*SizedBox(
          height: 100.0,
        ),
        ForthSection(),
        SizedBox(
          height: 50.0,
        ),
        FifthSection(),
        SizedBox(
          height: 50.0,
        ),
        SeventhSection(),
        SizedBox(
          height: 100.0,
        ),
        EighthSection(),
        SizedBox(
          height: 100.0,
        ),
        SixthSection(),
        SizedBox(
          height: 100.0,
        ),
        NinthSection(),*/
      ],
    );
  }

  _returnTab(int screen) {
    switch (screen) {
      case 0:
        return Container(
          width: double.infinity,
          child: Container(
            height: 700,
            width: 300,
            color: Colors.red,),
        );
        break;
      case 1:
        return Container(
          width: double.infinity,
            child: Container(
            height: 700,
            width: 300,
            color: Colors.blue,),
        );
        break;
      case 2:
        return Container(
          width: double.infinity,
          child: Container(
            height: 700,
            width: 300,
            color: Colors.green,),
        );
        break;
    }
  }
}
