import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Smalltext extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;

  Smalltext(
      {Key? key,
      required this.text,
      this.size = 12,
      this.height=1.2,
      this.color = const Color(0xFF322d2b)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      
      style: TextStyle(
        height: height,
          color: color, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
    );
  }
}