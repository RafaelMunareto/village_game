import 'package:flutter/material.dart';
import 'package:village/starter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Starter(),
    ),
  );
}
