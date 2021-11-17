import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IntervalActive extends StatefulWidget {
  const IntervalActive({Key? key, required this.set, required this.aMin, required this.aSec, required this.rMin, required this.rSec}) : super(key: key);

  final int set;
  final int aMin;
  final int aSec;
  final int rMin;
  final int rSec;

  @override
  _IntervalActiveState createState() => _IntervalActiveState();
}

class _IntervalActiveState extends State<IntervalActive> {
  int curSet = 0;
  int loopCounter = 0;
  int min = 0;
  int sec = 5;
  String curState = "Ready";
  Timer? timer;
  DateTime backPressedTime = DateTime(-1);

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (sec > 0){
        setState(() { sec -= 1; });
      }
      if (sec == 0){
        if (min > 0) {
          min -= 1;
          sec += 60;
          return;
        }
        if (loopCounter == 2*widget.set){
          stopTimer();
          curState = "Finish";
        }
        else if (loopCounter % 2 == 0){
          curSet += 1;
          loopCounter += 1;
          curState = "Active";
          min = widget.aMin;
          sec = widget.aSec - 1;
        }
        else if (loopCounter % 2 == 1) {
          loopCounter += 1;
          curState = "Rest";
          min = widget.rMin;
          sec = widget.rSec - 1;
        }
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (backPressedTime == DateTime(-1) ||
        now.difference(backPressedTime) > Duration(seconds: 2)) {
      backPressedTime = now;
      Fluttertoast.showToast(msg: "종료하려면 한 번 더 누르세요");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (curState == "Active") ? const Color(0xff01C7AE) : const Color(0xff54c701),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Row(
                children: [
                  const SizedBox(width: 40),
                  TText(
                    text: "Set $curSet",
                    size: 40,
                  )
                ],
              ),
              Container(
                width: 350,
                height: 300,
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: Colors.white
                  )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TText(text: curState, size: 30),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TText(text: "$min", size: 50),
                        const TText(text: " : ", size: 50),
                        TText(text: "$sec", size: 50)
                      ],
                    )
                  ],
                )
              ),
            ],
          ),
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
