import 'package:cesarFlutter/app/common/app_colors/app_colors.dart';
import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class SplashTab extends StatelessWidget {

  SplashTab(this.imagePath, this.title, this.description, this.tabController);

  final String imagePath;
  final String title;
  final String description;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splashBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.asset(imagePath)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(controller: tabController),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                title,
                style: Styles.splashTitle,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: Styles.splashDescription,
              )
            ],
          )
        ],
      ),
    );
  }
}
