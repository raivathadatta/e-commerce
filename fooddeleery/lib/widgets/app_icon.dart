import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key, required this.icon,this.iconsize=24,  this.backGrondColor=const Color(0xFFfcf4e4),  this.iconColor =Colors.black,  this.size=40}) : super(key: key);
final IconData icon;
final Color backGrondColor;
final Color iconColor;
final double size;
final double iconsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),

      ),
      color: iconColor,
      child: Icon(icon,size: iconsize,),
    );
  }
}