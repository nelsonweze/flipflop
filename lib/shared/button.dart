import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';

import 'text.dart';

class CustomFlatButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function onPressed;
  final bool round;
  final double width;
  final Color textColor;

  const CustomFlatButton(
      {Key key,
      this.text,
      this.round = false,
      this.icon,
      this.color,
      this.width,
      this.textColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: width ?? MediaQuery.of(context).size.width,
      child: FlatButton.icon(
        
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular( round? 32.0: 8), side: BorderSide(color: color != null ? prefix0.primary: prefix0.white)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () => onPressed(),
        label: Expanded(
          child: NormalText(
            text: '$text',
            align: TextAlign.center,
            color: textColor ?? prefix0.dark,
          ),
        ),
      ),
    );
  }
}
