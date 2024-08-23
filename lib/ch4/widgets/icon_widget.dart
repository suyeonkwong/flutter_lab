import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.asset('images/lab_instagram_icon_1.jpg', width: 35,),
          Image.asset('images/lab_instagram_icon_2.jpg', width: 35,),
          Image.asset('images/lab_instagram_icon_3.jpg', width: 35,),
          const Spacer(),
          Image.asset('images/lab_instagram_icon_4.jpg', width: 35,),
        ],
      ),
    );
  }
}
