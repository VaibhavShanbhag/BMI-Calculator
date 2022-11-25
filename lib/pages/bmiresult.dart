import 'package:flutter/material.dart';

class BMIResult extends StatefulWidget {
  final String name;
  final String gender;
  final int age;
  final int weight;
  final int height;
  const BMIResult(
      {Key? key,
      required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.gender})
      : super(key: key);

  @override
  State<BMIResult> createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("Hello World")),
    );
  }
}
