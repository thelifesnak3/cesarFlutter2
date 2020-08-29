import 'package:cesarFlutter/app/common/components/bottomappbar/bottomappbar_button.dart';
import 'package:cesarFlutter/app/common/components/bottomappbar/bottomappbar_navigation.dart';
import 'package:cesarFlutter/app/pages/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  var tabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      tabIndex = index;
    });
    print("kalsekasçlekçasl");
  }
  

  @override
  Widget build(BuildContext context) {

    var childList = [
      HomeTab(),
      Container(color: Colors.red),
      Container(color: Colors.yellow),
      Container(color: Colors.cyan),
    ];

    return DefaultTabController(
      length: 4,
      initialIndex: tabIndex,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: childList[tabIndex],
        bottomNavigationBar: FABBottomAppBar(
          color: Colors.grey,
          selectedColor: Colors.red,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(
              iconSelected: "assets/icons/bottomappbar/home_selected.png",
              iconUnselected: "assets/icons/bottomappbar/home_unselected.png"
            ),
            FABBottomAppBarItem(
              iconSelected: "assets/icons/bottomappbar/tv_selected.png",
              iconUnselected: "assets/icons/bottomappbar/tv_unselected.png"
            ),
            FABBottomAppBarItem(
              iconSelected: "assets/icons/bottomappbar/radio_selected.png",
              iconUnselected: "assets/icons/bottomappbar/radio_unselected.png"
            ),
            FABBottomAppBarItem(
              iconSelected: "assets/icons/bottomappbar/bell_selected.png",
              iconUnselected: "assets/icons/bottomappbar/bell_unselected.png"
            ),
          ],
        ),
        floatingActionButton: BottomappbarButton(() => {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  
}