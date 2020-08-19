import 'package:cesarFlutter/app/pages/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            HomeTab(),
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.orange),
          ]
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              child: Container(
                height: 20.56,
                width: 24,
                child: Image.asset("assets/icons/home.png"),
              )
            ),
            Tab(
              child: Container(
                height: 19.01,
                width: 24.74,
                child: Image.asset("assets/icons/tv.png"),
              )
            ),
            Tab(
              child: Container(
                height: 19.6,
                width: 21.87,
                child: Image.asset("assets/icons/radio.png"),
              )
            )
            ,Tab(
              child: Container(
                height: 23.56,
                width: 18,
                child: Image.asset("assets/icons/bell.png"),
              )
            )
          ],
          labelColor: Color(getColorHexFromStr("#3E2AD1")),
          unselectedLabelColor: Colors.black54,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Color(getColorHexFromStr("#3E2AD1")),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  Widget _bottomButtons() {
    return FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: null,
      backgroundColor: Color(getColorHexFromStr("#3E2AD1")),
      child: Container(
        height: 20,
        width: 20,
        child: Image.asset("assets/icons/btn_floating.png"),
      )
    );
  }
}


int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}