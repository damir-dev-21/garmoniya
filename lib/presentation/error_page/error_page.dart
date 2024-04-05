import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key? key, required this.text}) : super(key: key);
  final text;
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(widget.text),
        ),
      ),
    );
  }
}
