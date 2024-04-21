import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatelessWidget {
  final List<String> images = [
    'assets/banner/banner.png',
    'assets/banner/banner2.png',
    'assets/banner/banner3.png',
    // Thêm đường dẫn của các hình ảnh banner khác nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayInterval: Duration(seconds: 3),
        enableInfiniteScroll: true,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
