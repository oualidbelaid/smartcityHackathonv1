import 'package:flutter/material.dart';
import 'package:smart_city/view/widget/auth/imageconnect.dart';
import '../../../core/constant/appimage.dart';

class Orconnect extends StatelessWidget {
  const Orconnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Imageconnect(image: AppImage.google),
          Imageconnect(image: AppImage.facboock),
          Imageconnect(image: AppImage.twitter),
        ],
      ),
    );
  }
}
