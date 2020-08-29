import 'package:cesarFlutter/app/pages/home/home_controller.dart';
import 'package:cesarFlutter/app/pages/home/home_page.dart';
import 'package:cesarFlutter/app/pages/splash/splash_page.dart';
import 'package:cesarFlutter/app/shared/repositories/ApiRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends  MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<ApiRepository>())),
    Bind((i) => ApiRepository()),
  ];

  @override
  List<ModularRouter> get routers => [
                  /*-----------
                    |ROUTES|
                  -----------*/
    ModularRouter('/',
        child: (_, args) => SplashPage()),

    ModularRouter('/home',
        child: (_, args) => HomePage(),
        transition: TransitionType.rightToLeftWithFade)
  ];

  @override
  Widget get bootstrap => AppWidget();

}
