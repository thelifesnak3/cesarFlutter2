import 'package:cesarFlutter/app/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class BottomappbarButton extends StatelessWidget {

  BottomappbarButton(this.func);

  final Function func;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      elevation: 2.0,
      onPressed: func,
      backgroundColor: AppColors.defaultBottomNavigationColor,
      child: Container(
        height: 20,
        width: 20,
        child: Image.asset("assets/icons/btn_floating.png"),
      )
    );
  }
}