import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClockController extends GetxController with SingleGetTickerProviderMixin {
  var time = DateTime.now().obs;

  var animation;
  var animationController;

  @override
  void onInit() {
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      time.value = DateTime.now();
    });
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      } else if (animationController.isDismissed) {
        animationController.forward();
      }
    });
    animationController.forward(); // For Starting Animation
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5, end: 0.5).animate(animation);
  }
}
