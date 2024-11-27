// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:crypto_ui_web/bloc/screen_offset.dart';
import 'package:crypto_ui_web/constant/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'motivation_letter/motivation_letter.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        //textTheme: GoogleFonts.robotoCondensedTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leadingWidth: 420,
        backgroundColor: AppColors.scaffoldColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/Frame 19.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Home',
              style: TextStyle(
                  fontFamily: 'CH',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'About',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Services',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Price',
                style: TextStyle(
                    fontFamily: 'CH',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
            onPressed: () {},
            child: const Text(
              'News',
              style: TextStyle(
                  fontFamily: 'CH',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.scaffoldColor,
                  side: const BorderSide(color: AppColors.secondaryColor)),
              child: const Text(
                'Get started',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                    fontFamily: 'CH',
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),*/
      backgroundColor: AppColors.scaffoldColor,
      body: BlocProvider(
        create: (context) => DisplayOffset(ScrollOffset(scrollOffsetValue: 0)),
        child: const MotivationLetter(),
      ),
    );
  }
}
