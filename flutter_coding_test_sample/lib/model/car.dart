import 'package:flutter/material.dart';

enum Car {
  granace,
  sienta,
  raise,
  yariscross,
  fjcruser
}

extension CarExt on Car {
  String get name {
    return this.toString().split('.')[1];
  }

  String get imagePath {
    switch(this) {
      case Car.granace:
        return 'assets/car_1.jpeg';
      case Car.sienta:
        return 'assets/car_2.jpeg';
      case Car.raise:
        return 'assets/car_3.jpeg';
      case Car.yariscross:
        return 'assets/car_4.jpeg';
      case Car.fjcruser:
        return 'assets/car_5.jpeg';
    }
  }
}