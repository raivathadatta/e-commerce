
import 'package:flutter/cupertino.dart';
import 'package:fooddeleery/widgets/smalltext.dart';


class IconsAndTextWidget extends StatelessWidget {


final IconData icon;
final String text;

final Color iconColoe;

  const IconsAndTextWidget({Key? key, required this.icon, required this.text, required this.iconColoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColoe,),
        const SizedBox(width: 5,),
        Smalltext(text: text,)
      ],
    );
  }
}