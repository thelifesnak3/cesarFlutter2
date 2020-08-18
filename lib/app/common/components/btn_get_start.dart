import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class BtnGetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
//      fillColor: Colors.red,
      splashColor: Colors.grey,
      textStyle: TextStyle(color: Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "GET START",
            style: Styles.splashGetStart,
          ),
          Image.asset("assets/icons/btn_splash.png")
        ],
      ),
      onPressed: () {},
    );
  }
}
