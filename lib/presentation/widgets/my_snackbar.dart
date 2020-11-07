import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { error, success }

class MySnackBar {
  final String message;
  final SnackType type;
  final int timeDelay;
  final int duration;
  MySnackBar({
    this.message: '',
    this.type: SnackType.error,
    this.timeDelay,
    this.duration,
  }) {
    _show();
  }

  void _show() async {
    try {
      if (timeDelay != null) await Future.delayed(Duration(seconds: timeDelay));
      if (Get.isSnackbarOpen) return;
      Get.snackbar(
        null,
        null,
        messageText: Text(
          message,
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: type == SnackType.error ? Colors.red : Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        duration: Duration(
            seconds: duration != null
                ? duration
                : (type == SnackType.error ? 5 : 1)),
      );
    } catch (erro) {
      print(erro);
    }
  }
}
