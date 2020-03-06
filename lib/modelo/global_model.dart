import 'package:flutter/material.dart';
import 'package:test_bloc/logica/global_logic.dart';
import 'package:test_bloc/modelo/main_page_model.dart';

class GlobalModel extends ChangeNotifier {
  GlobalLogic logic;
  BuildContext context;

  MainPageModel mainPageModel;
  bool goToLogin;
  GlobalModel() {
    logic = GlobalLogic(this);
  }
  String appName = "ALLEMANT PERITOS";
  Locale currentLocale;
  List<String> currentLanguageCode = ["es", "PE"];
  bool enableSplashAnimation = true;



  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      Future.wait([
        logic.getLoginState(),
      ]).then((value) {
        currentLocale = Locale(currentLanguageCode[0], currentLanguageCode[1]);
        refresh();
      });
    }
  }
  void setMainPageModel(MainPageModel mainPageModel) {
    if (this.mainPageModel == null) {
      this.mainPageModel = mainPageModel;
      debugPrint("设置mainPageModel");
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("GlobalModel销毁了");
  }
  
  void refresh() {
    notifyListeners();
  }

}