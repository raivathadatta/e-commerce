
import 'package:flutter/material.dart';

import 'package:fooddeleery/widgets/icon_text.dart';

import 'bigtext.dart';

import 'smalltext.dart';

class AppColumn extends StatelessWidget {
  const AppColumn(String s, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigText(text: "dummy dummy dummy dummy"),
        Smalltext(text: "whithh Dummy dumy"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IconsAndTextWidget(
                icon: Icons.circle, text: "Normal", iconColoe: Colors.pink),
            SizedBox(
              height: 5,
            ),
            IconsAndTextWidget(
                icon: Icons.location_city,
                text: "1.0km",
                iconColoe: Colors.blue),
            SizedBox(
              height: 5,
            ),
            IconsAndTextWidget(
                icon: Icons.access_time_filled,
                text: "2.03h",
                iconColoe: Colors.red),
          ],
        ),
      ],
    );
  }
}
