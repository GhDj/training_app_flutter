import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:layouted/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: Colors.black87),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[400],
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                      size: 20, color: Colors.black87),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade900.withOpacity(0.8),
                  Colors.blue.shade400.withOpacity(0.9)
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: Colors.blue.shade300.withOpacity(0.2))
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'and Glutes Workout',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer, size: 20, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 min',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade900,
                                    blurRadius: 10,
                                    offset: Offset(4, 4))
                              ]),
                          child: Icon(Icons.play_circle_fill,
                              size: 60, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20),
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: Colors.blue.shade400.withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-2, -5),
                              color: Colors.blue.shade400.withOpacity(0.3))
                        ]),
                  ),
                  Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/figure.png")),
                      )),
                  Container(
                    width: double.maxFinite,
                    height: 120,
                    margin: const EdgeInsets.only(left: 150, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                children: [
                              TextSpan(text: "stick to your plan")
                            ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (_, i) {
                        return Row(
                          children: [
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin: EdgeInsets.only(
                                  left: 30, bottom: 15, top: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(info[i * 2]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: Colors.blue.shade300
                                            .withOpacity(0.1)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: Colors.blue.shade300
                                            .withOpacity(0.1))
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[i * 2]['title'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade400),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin: EdgeInsets.only(
                                  left: 30, bottom: 15, top: 15),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(info[i * 2 + 1]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(5, 5),
                                        color: Colors.blue.shade300
                                            .withOpacity(0.1)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-5, -5),
                                        color: Colors.blue.shade300
                                            .withOpacity(0.1))
                                  ]),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[i * 2 + 1]['title'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade400),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      })),
            ))
          ],
        ),
      ),
    );
  }
}
