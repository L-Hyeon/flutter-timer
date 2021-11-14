import 'package:flutter/material.dart';

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

class ChoosePage extends StatelessWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      body: Column(
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

                    },
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
