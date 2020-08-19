import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class BtnShare extends StatelessWidget {

  BtnShare(this.func);

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
          Icon(
            Icons.share,
            size: 12,
            color: Colors.red,
          )
        ],
      ),
      onPressed: () { func(); },
    );
  }
}
