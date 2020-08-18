import 'package:cesarFlutter/app/common/app_colors/app_colors.dart';
import 'package:cesarFlutter/app/common/components/btn_get_start.dart';
import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:cesarFlutter/app/pages/splash/splash_tab.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.splashBackgroundColor,
      //   elevation: 0,
      // ),
      body: Container(
        color: AppColors.splashBackgroundColor,
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            TabBarView(
                controller: _tabController,
                children: [
                  SplashTab(
                      "assets/images/splash-image-1.png",
                      "Listening And Watching Anytime, Anywhere",
                      "The artists we represent are one of the most successful in"
                      "Romania and also were a huge breakthrough.",
                      _tabController),
                  SplashTab(
                      "assets/images/splash-image-1.png",
                      "Listening And Watching Anytime, Anywhere 2",
                      "The artists we represent are one of the most successful in"
                      "Romania and also were a huge breakthrough..",
                      _tabController
                  ),
                  SplashTab(
                      "assets/images/splash-image-1.png",
                      "Listening And Watching Anytime, Anywhere 3",
                      "The artists we represent are one of the most successful in"
                      "Romania and also were a huge breakthrough...",
                      _tabController
                  )
                ]
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: BtnGetStart()
            )
          ],
        )
      ) 
    );
  }
}