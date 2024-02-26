import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import 'ImageSlider.dart';
class productdetails extends StatelessWidget {
  PageController controller;
  String Image1;
  String Image2;
  String Image3;
   productdetails({super.key,required this.controller,
  required this.Image1,
  required this.Image2,
  required this.Image3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                SmoothPageIndicator(
                  axisDirection: Axis.vertical,
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    offset: 32,
                    dotColor: Colors.grey.shade200,
                    activeDotColor: Colors.blue,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                Column(
                  children: [
                    OtherImages(ImageLink: Image1),
                    OtherImages(ImageLink: Image2),
                    OtherImages(ImageLink: Image3),
                  ],
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.3,
            child: PageView(
              controller: controller,
              children: [
                ImageSlider(ImageLink: Image1),
                ImageSlider(ImageLink:Image2),
                ImageSlider(ImageLink: Image3),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
