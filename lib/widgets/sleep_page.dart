import 'package:flutter/material.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  int hour = 0;
  int min = 0;
  int sec = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      appBar: AppBar(
        backgroundColor: const Color(0xff01C7AE),
        elevation: 0,
      ),
      endDrawer: Drawer(),
    );
  }
}
