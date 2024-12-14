// Flutter imports:
// Project imports:
import 'package:crypto_ui_web/constant/color.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';
import 'package:logger/logger.dart';

import 'cirriculum_vitae/cirriculum_vitae.dart';
import 'list_of_courses/list_of_courses.dart';
import 'motivation_letter/controller.dart';
import 'motivation_letter/motivation_letter.dart';
import 'motivation_letter/sections/heading.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        //textTheme: GoogleFonts.robotoCondensedTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late ScrollController _scrollController;

  GlobalKey listViewKey = GlobalKey();

  @override
  void initState() {
    _scrollController = ScrollController();
    motivationScrollControllerProvider =
        Provider<ScrollController>((ref) => _scrollController);

    listViewKeyProvider =
        Provider<GlobalKey<State<StatefulWidget>>>((ref) => listViewKey);

    _scrollController.addListener(() {
      ref.read(offsetStateProvider.notifier).state =
          (MediaQuery.of(context).size.height +
                  _scrollController.position.pixels)
              .toInt();
      Logger().i(MediaQuery.of(context).size.height);
      Logger().i(MediaQuery.of(context).size.height +
          _scrollController.position.pixels);
      Logger().i(listViewKey.currentContext?.size?.height);
      Logger().i(_scrollController.position.maxScrollExtent);
      final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      Logger().i('Position: $position');
    });
    super.initState();
  }

  final GlobalKey _key = GlobalKey();  // GlobalKey to track the widget

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: ListView(
            key: listViewKey,
            controller: _scrollController,
            children: [
              Heading(),
              ...[
                [ListOfCourses()],
                [MotivationLetter()],
                [CurriculumVitae()],
                [
                ],
              ][ref.watch(tabStateProvider)],
            ]));
  }
}
