import 'package:flutter/material.dart';
import 'package:village/starter.dart';

const double tileSize = 32;
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Starter(),
    ),
  );
}
