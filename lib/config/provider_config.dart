import 'package:provider/provider.dart';
import 'package:test_bloc/modelo/global_model.dart';
import 'package:test_bloc/modelo/login_m.dart';
import 'package:test_bloc/modelo/main_page_model.dart';
import 'package:test_bloc/pages/home/login_page.dart';
import 'package:test_bloc/pages/main/main_page.dart';

import 'package:flutter/material.dart';
class ProviderConfig {
  
  static ProviderConfig _instance;
  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }
  
  ProviderConfig._internal();

      /// GLOBAL - MAIN.DART
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }
ChangeNotifierProvider<MainPageModel> getMainPage() {
    return ChangeNotifierProvider<MainPageModel>(
      create: (context) => MainPageModel(),
      child: MainPage(),
    );
  }
  
  ChangeNotifierProvider<LoginPageModel> getLoginPage({bool isFirst = false}) {
    return ChangeNotifierProvider<LoginPageModel>(
      create: (context) => LoginPageModel(isFirst: isFirst),
      child: LoginPage(),
    );
  }
  


}

  