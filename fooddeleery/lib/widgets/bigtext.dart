import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20,
      this.color = const Color(0xFF322d2b)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
    );
  }
}
