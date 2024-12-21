import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Imageconnect extends StatelessWidget {
  final String image;
  const Imageconnect({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("google");
        },
        child: Image.asset(
          image,
          width: 7.w,
          height: 7.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
