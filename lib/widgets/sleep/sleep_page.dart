import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  DateTime backPressedTime = DateTime(-1);
  int sec = 1;
  int initSec = 1;
  int min = 15;
  String state = "Start";
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (sec > 0){
        setState(() {
          sec -= 1;
          if (sec % 60 == 0){
            min -= 1;
          }
        });
      }
      else if (sec == 0){
        setState(() {
          state = "Start";
        });
        stopTimer();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Center(
              child: TText(
                text: "Sleep Timer",
                size: 50
              )
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: 250,
              height: 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: sec/initSec,
                    strokeWidth: 10,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                  Center(
                    child: TText(
                      text: min.toString(),
                      size: 50,
                    )
                  )
                ]
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      if (state == "Start"){
                        min += 15;
                        return;
                      }
                      if (sec > 900){
                        initSec -= 900;
                        sec -= 900;
                        min -= 15;
                      }
                      else {
                        Fluttertoast.showToast(msg: "15분도 안 남았습니다");
                      }
                    });
                  },
                  child: const TText(
                    text: "-15",
                    size: 30,
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      if (state == "Pause"){
                        state = "Resume";
                        stopTimer();
                      }
                      else if (state == "Start"){
                        state = "Pause";
                        initSec = 60*min;
                        sec = initSec;
                        startTimer();
                      }
                      else {
                        state = "Pause";
                        startTimer();
                      }
                    });
                  },
                  child: TText(
                    text: state,
                    size: 30
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      if (state == "Start"){
                        min += 15;
                        return;
                      }
                      min += 15;
                      sec += 900;
                      initSec += 900;
                    });
                  },
                  child: const TText(
                    text: "+15",
                    size: 30,
                  ),
                )
              ],
            )
          ],
        ),
      )
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