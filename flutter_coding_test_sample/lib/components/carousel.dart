import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_test_sample/model/car.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 300.0
      ),
      items: Car.values.map((car) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: carouselItem(car),
            );
          },
        );
      }).toList(),
    );
  }

  Widget carouselItem(Car car) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(car.imagePath),
          SizedBox(height: 12),
          Text(car.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      )
    );
  }
}
