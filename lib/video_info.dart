import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:layouted/home_page.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
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
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                    Colors.blue.shade900.withOpacity(0.8),
                    Colors.blue.shade400.withOpacity(0.9)
                  ],
                    begin: const FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight))
            : BoxDecoration(
                color: Colors.blue.shade400.withOpacity(0.9),
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.arrow_back_ios,
                                  size: 20, color: Colors.white),
                              onTap: () {
                                Get.to(() => HomePage());
                              },
                            ),
                            Expanded(child: Container()),
                            Icon(Icons.info_outline,
                                size: 20, color: Colors.white),
                          ],
                        ),
                        SizedBox(
                          height: 30,
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
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade200.withOpacity(0.3),
                                        Colors.blue.shade300.withOpacity(0.3)
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: Colors.white60,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "68 min",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white60),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 220,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade200.withOpacity(0.3),
                                        Colors.blue.shade300.withOpacity(0.3)
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: Colors.white60,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resistent band, kettelbell",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white60),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  //TODO:
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context)
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Circuit 1 : Legs Toning",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: Colors.blue.shade300,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "3 sets",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: _listView())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _controlView(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue.shade400.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: () async {},
              child: Icon(
                Icons.fast_rewind,
                size: 36,
                color: Colors.white,
              )),
          FlatButton(
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
              child: Icon(
                _isPlaying ? Icons.play_arrow : Icons.pause,
                size: 36,
                color: Colors.white,
              )),
          FlatButton(
              onPressed: () async {},
              child: Icon(
                Icons.fast_forward,
                size: 36,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  _buildCard(int i) {
    return Container(
      height: 135,
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(info[i]['thumbnail']),
                          fit: BoxFit.cover))),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[i]["title"],
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      info[i]["time"],
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Color(0xFF839fed),
                                borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: info.length,
        itemBuilder: (_, int i) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(i);
              debugPrint(i.toString()); //for debug/test
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(i),
          );
        });
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Text(
          "Being initialized pls wait ...",
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
      );
    }
  }

  var _onControllerUpdateTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onControllerUpdateTime = 0;

    final now = DateTime.now().millisecondsSinceEpoch;

    if (_onControllerUpdateTime > now) {
      return;
    }

    _onControllerUpdateTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(index) {
    final controller = VideoPlayerController.network(info[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }
}
