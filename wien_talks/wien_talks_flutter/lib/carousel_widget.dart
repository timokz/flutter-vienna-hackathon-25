import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CarouselSlider(
        options: CarouselOptions(height: 300.0, autoPlay: true),
        items: ["houses.jpg", "kangaroos.jpg", "sightseeing.jpg", "tram.jpg", "fiaker.jpg", "falco.jpg", "wastebin.jpg"].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  //decoration: BoxDecoration(color: Colors.amber),
                  child: Image(image: AssetImage("assets/funny_images/$i")));
            },
          );
        }).toList(),
      ),
    );
  }
}
