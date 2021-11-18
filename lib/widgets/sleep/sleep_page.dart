import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  DateTime backPressedTime = DateTime(-1);
  int sec = 15;
  String state = "Start";
  CountDownController _controller = CountDownController();


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
            CircularCountDownTimer(
              width: 250,
              height: 250,
              duration: sec,
              fillColor: Colors.transparent,
              ringColor: Colors.white,
              controller: _controller,
              isReverse: true,
              textStyle: const TextStyle(
                fontFamily: "Cafe24",
                fontSize: 30,
                color: Colors.white
              ),
              autoStart: false,
              onComplete: (){
                state = "Start";
              }
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      if (state == "Start"){
                        sec += 15;
                        return;
                      }
                      if (sec > 900){
                        sec -= 900;
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
                    if (state == "Stop"){
                      state = "Resume";
                      _controller.pause();
                    }
                    else if (sec == 0){
                      state = "Stop";
                      sec *= 60;
                      print(sec);
                      _controller.start();
                    }
                    else {
                      state = "Stop";
                      _controller.resume();
                    }
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
                        sec += 15;
                        return;
                      }
                      sec += 900;
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