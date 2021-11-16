import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timer/widgets/interval/interval_page.dart';
import 'package:timer/widgets/sleep/sleep_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "One Timer",
      home: ChoosePage()
    );
  }
}

class ChoosePage extends StatefulWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  DateTime backPressedTime = DateTime(-1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 180),
            const Center(
              child: Text(
                "One Timer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cafe24"
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 130,
                  height: 100,
                  child: InkWell(
                    child: Column(
                      children: const <Widget> [
                        Icon(
                            Icons.access_alarm,
                            size: 70,
                            color: Colors.white
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Sleep",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Cafe24"
                          ),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepPage()));
                    },
                  )
                ),
                Container(
                    width: 130,
                    height: 100,
                    child: InkWell(
                      child: Column(
                        children: const <Widget> [
                          Icon(
                              Icons.timer_outlined,
                              size: 70,
                              color: Colors.white
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Interval",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Cafe24"
                            ),
                          )
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const IntervalPage()));
                      },
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (backPressedTime == DateTime(-1) ||
        now.difference(backPressedTime) > Duration(seconds: 2)) {
      backPressedTime = now;
      Fluttertoast.showToast(msg: "앱을 종료하려면 한 번 더 누르세요");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
