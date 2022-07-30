import 'package:flutter/material.dart';
import 'package:village/pages/home_page.dart';
import 'package:village/utils/faade_page_transitions.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.linux: FadePageTransition(),
            },
          )),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}
