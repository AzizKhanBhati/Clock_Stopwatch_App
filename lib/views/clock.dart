import 'package:clock_stopwatch/controller/clockcontroller.dart';
import 'package:clock_stopwatch/views/Header.dart';
import 'package:clock_stopwatch/views/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clock extends StatelessWidget {
  final controller = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: "Clock App",
                titleColor: Colors.brown.shade900,
                subTitle: "with simple animation.",
                subTitleColor: Colors.brown.shade900,
              ),
              SizedBox(),
              Obx(() {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.brown.shade900,
                        child: Container(
                          width: 280,
                          height: 280,
                          child: Center(
                            child: Text(
                              "${controller.time.value.hour.toString()} : ${controller.time.value.minute.toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Transform(
                        alignment: FractionalOffset(0.5, 0.1),
                        transform:
                            Matrix4.rotationZ(controller.animation.value),
                        child: Container(
                          child: Image.asset(
                            'assets/pandulum.png',
                            width: 90,
                            height: 235,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => Stopwatch());
        },
        label: Text("Stopwatch"),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Colors.brown[900],
      ),
    );
  }
}
