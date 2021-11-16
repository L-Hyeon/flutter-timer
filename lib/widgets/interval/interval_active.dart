import 'package:flutter/material.dart';

class IntervalActive extends StatefulWidget {
  const IntervalActive({Key? key, required this.set, required this.aMin, required this.aSec, required this.rMin, required this.rSec}) : super(key: key);

  final int set;
  final String aMin;
  final String aSec;
  final String rMin;
  final String rSec;

  @override
  _IntervalActiveState createState() => _IntervalActiveState();
}

class _IntervalActiveState extends State<IntervalActive> {
  int loopCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Row(
              children: [
                const SizedBox(width: 40),
                TText(
                  text: "Set ${widget.set}",
                  size: 40,
                )
              ],
            ),
            Container(
              width: 350,
              height: 300,
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: Colors.white
                )
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TText(text: "Active", size: 30)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class TText extends StatelessWidget {
  final String text;
  final double size;

  const TText({required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            fontFamily: "Cafe24",
            fontSize: size,
            color: Colors.white
        )
    );
  }
}
