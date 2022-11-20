import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String userName;
  const DetailsScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(this.widget.userName)),
    );
  }
}
