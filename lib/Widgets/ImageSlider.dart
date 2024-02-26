import 'package:flutter/material.dart';
class ImageSlider extends StatelessWidget {
  String ImageLink;
   ImageSlider({super.key,required this.ImageLink});

  @override
  Widget build(BuildContext context) {
    return Image(

        image: AssetImage(
         ImageLink,
        ),
        fit: BoxFit.cover);
  }
}
class OtherImages extends StatelessWidget {
  String ImageLink;
   OtherImages({super.key,required this.ImageLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(height: MediaQuery.of(context).size.height*0.08,
          width: 40,

          image: AssetImage(
            ImageLink,
          ),
          fit: BoxFit.fitHeight),
    );
  }
}
