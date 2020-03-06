import 'package:flutter/material.dart';
import 'package:test_bloc/logica/main_page_logic.dart';
import 'global_model.dart';
import 'package:test_bloc/config/api_service.dart';

class MainPageModel extends ChangeNotifier {
  MainPageLogic logic;
  BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CancelToken cancelToken = CancelToken();


  GlobalModel _globalModel;

  MainPageModel() {
    logic = MainPageLogic(this);
  }


  @override
  void dispose() {
    super.dispose();
    scaffoldKey?.currentState?.dispose();
    if(!cancelToken.isCancelled) cancelToken.cancel();
    _globalModel.mainPageModel = null;
    debugPrint("MainPageModel销毁了");
  }

  void refresh() {
    notifyListeners();
  }
}

class CurrentAvatarType {
  static const int defaultAvatar = 0;
  static const int local = 1;
  static const int net = 2;
}
