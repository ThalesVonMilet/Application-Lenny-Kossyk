// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'common/constant/color.dart';
import 'common/controller.dart';
import 'common/widget/heading.dart';
import 'features/cirriculum_vitae/cirriculum_vitae.dart';
import 'features/list_of_courses/list_of_courses.dart';
import 'features/motivation_letter/motivation_letter.dart';

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
        scaffoldBackgroundColor:   AppColors.scaffoldColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
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
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery
        .of(context)
        .size
        .width < 1000) {
      return Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          body: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('Please use a bigger screen to view this website.',textAlign: TextAlign.center, style: TextStyle(fontSize: 30,
              fontFamily: 'CH',
              fontWeight: FontWeight.w500,
              color: Colors.white,)),
          ),
          ));
    }

    return Scaffold(
        body: ListView(controller: _scrollController, children: [
          Heading(),
          ...[
            [ListOfCourses()],
            [
              MotivationLetter(
                scrollController: _scrollController,
              )
            ],
            [CurriculumVitae()],
          ][ref.watch(tabStateProvider)],
        ]));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
