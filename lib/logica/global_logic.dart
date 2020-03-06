
import 'package:test_bloc/modelo/global_model.dart';
import 'package:test_bloc/utils/shared_util.dart';

class GlobalLogic{

  final GlobalModel _model;

  GlobalLogic(this._model);

  Future getLoginState() async{
    final hasLogged = await SharedUtil.instance.getBoolean(Keys.hasLogged);
    _model.goToLogin = !hasLogged;
  }


}