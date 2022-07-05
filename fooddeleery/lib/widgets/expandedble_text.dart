
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddeleery/widgets/smalltext.dart';

import '../utils/app-colors.dart';

class ExpandableTextWidget extends StatefulWidget {

  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firsthalf;
    late  String secondhalf;
    bool hideText =true;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>200){
      firsthalf =widget.text.substring(0,200);
      secondhalf=widget.text.substring(201,widget.text.length);
    }else{
      firsthalf = widget.text;
      secondhalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty? Smalltext(text: firsthalf): Column(
        children: [
          Smalltext(text:hideText ? "$firsthalf....":firsthalf+secondhalf),
          InkWell(
            onTap: () {
              
            },
            child: Row(
              children: [
                Smalltext(text: "show more",color: AppColors.mainColor,),
                const Icon(Icons.arrow_forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}