import 'package:clock_stopwatch/views/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final StopWatchTimer stopWatchTimer = StopWatchTimer();

  @override
  void dispose() {
    stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: "Stopwatch",
                subTitle: "with all functions.",
              ),

              /// body
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<int>(
                      stream: stopWatchTimer.rawTime,
                      initialData: 0,
                      builder: (context, snapshot) {
                        final value = snapshot.data;
                        final displayTime =
                            StopWatchTimer.getDisplayTime(value!, hours: true);
                        return Text(
                          displayTime,
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            color: Colors.green,
                            onPress: () {
                              stopWatchTimer.onExecute
                                  .add(StopWatchExecute.start);
                            },
                            label: "Start"),
                        SizedBox(
                          width: 16,
                        ),
                        CustomButton(
                            color: Colors.red,
                            onPress: () {
                              stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop);
                            },
                            label: "Stop"),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        color: Colors.orange,
                        onPress: () {
                          stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                        },
                        label: "Lap"),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        color: Colors.black87,
                        onPress: () {
                          stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                        },
                        label: "Reset"),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 180,
                      margin: const EdgeInsets.all(8.0),
                      child: StreamBuilder<List<StopWatchRecord>>(
                        stream: stopWatchTimer.records,
                        builder: (context, snap) {
                          final value = snap.data;
                          if (value!.isEmpty) {
                            return Container();
                          }
                          return ListView.builder(
                            itemCount: value.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final data = value[index];
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${index + 1} - ${data.displayTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.back();
        },
        label: Text(
          "Clock",
        ),
        icon: Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.brown[900],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final Function onPress;
  final String label;
  const CustomButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      shape: const StadiumBorder(),
      onPressed: () {
        onPress();
      },
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
