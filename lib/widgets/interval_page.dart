import 'package:flutter/material.dart';

class IntervalPage extends StatefulWidget {
  const IntervalPage({Key? key}) : super(key: key);

  @override
  State<IntervalPage> createState() => _IntervalPageState();
}

class _IntervalPageState extends State<IntervalPage> {
  int sets = 0;
  final activeMin = TextEditingController();
  final activeSec = TextEditingController();
  final restMin = TextEditingController();
  final restSec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01C7AE),
      appBar: AppBar(
        backgroundColor: const Color(0xff01C7AE),
        elevation: 0,
      ),
      endDrawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: TText(
                text: "Interval Timer",
                size: 50,
              )
            ),
            const SizedBox(height: 30),
            Container(
              width: 350,
              height: 350,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: TText(
                      text: "Sets",
                      size: 20,
                    )
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          setState(() {
                            if (sets == 0){
                              return;
                            }
                            sets -= 1;
                          });
                        },
                      ),
                      TText(text: "$sets", size: 20),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          setState(() {
                            sets += 1;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: TText(
                      text: "Active",
                      size: 20,
                    )
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 130,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Colors.white
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 55,
                          child: TextField(
                            controller: activeMin,
                            decoration: const InputDecoration(
                              hintText: "00",
                              hintStyle: TextStyle(
                                  fontFamily: "Cafe24",
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1
                                  )
                              )
                            ),
                            style: const TextStyle(
                              fontFamily: "Cafe24",
                              fontSize: 20,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Center(
                          child: TText(
                            text: ":",
                            size: 20,
                          ),
                        ),
                        Container(
                          width: 55,
                          child: TextField(
                            controller: activeSec,
                            decoration: const InputDecoration(
                                hintText: "00",
                                hintStyle: TextStyle(
                                    fontFamily: "Cafe24",
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                )
                            ),
                            style: const TextStyle(
                                fontFamily: "Cafe24",
                                fontSize: 20,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                      child: TText(
                        text: "Rest",
                        size: 20,
                      )
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 130,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1,
                            color: Colors.white
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 55,
                          child: TextField(
                            controller: restMin,
                            decoration: const InputDecoration(
                                hintText: "00",
                                hintStyle: TextStyle(
                                    fontFamily: "Cafe24",
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                )
                            ),
                            style: const TextStyle(
                                fontFamily: "Cafe24",
                                fontSize: 20,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Center(
                          child: TText(
                            text: ":",
                            size: 20,
                          ),
                        ),
                        Container(
                          width: 55,
                          child: TextField(
                            controller: restSec,
                            decoration: const InputDecoration(
                                hintText: "00",
                                hintStyle: TextStyle(
                                    fontFamily: "Cafe24",
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1
                                    )
                                )
                            ),
                            style: const TextStyle(
                                fontFamily: "Cafe24",
                                fontSize: 20,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            )
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
