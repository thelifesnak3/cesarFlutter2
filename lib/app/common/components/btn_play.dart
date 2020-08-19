import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class BtnPlay extends StatelessWidget {

  BtnPlay(this.func);

  final Function func;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.white,
      textStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "PLAY ",
            style: Styles.homePlayLabel,
          ),
          Icon(
            Icons.play_arrow,
            size: 12,
            color: Colors.red,
          )
        ],
      ),
      onPressed: () { func(); },
    );
  }
}
