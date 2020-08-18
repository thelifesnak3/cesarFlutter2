import 'package:cesarFlutter/app/pages/home/home_page.dart';
import 'package:cesarFlutter/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends  MainModule {

  @override
  List<Bind> get binds => [
    // Bind((i) => AppController()),
    // Bind((i) => ConsultarSeloController(i.get<SeloRepository>())),
  ];

  @override
  List<Router> get routers => [
                  /*-----------
                    |ROUTES|
                  -----------*/
    Router('/',
        child: (_, args) => SplashPage()),

    Router('/home',
        child: (_, args) => HomePage(),
        transition: TransitionType.rightToLeftWithFade)
  ];

  @override
  Widget get bootstrap => AppWidget();

}
