import 'package:flutter/material.dart';
import 'package:test_bloc/logica/login_bl.dart';

import 'package:test_bloc/config/api_service.dart';

class LoginPageModel extends ChangeNotifier{

  LoginPageLogic logic;
  BuildContext context;

  String currentAnimation = "move";
  bool showLoginWidget = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailOk = false;
  bool isPasswordOk = false;  
  bool isLoginNow = false;

  /// indica si la página de inicio de sesión es la primera página
  bool isFirst;
  final formKey = GlobalKey<FormState>();
  CancelToken cancelToken = CancelToken();

   LoginPageModel({bool isFirst = false}){
    logic = LoginPageLogic(this);
    this.isFirst = isFirst;
    print(this.isFirst);
    print(isFirst);
  }

  void setContext(BuildContext context){
    if(this.context == null){
        this.context = context;
    }
  }

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    cancelToken?.cancel();
    formKey?.currentState?.dispose();
    super.dispose();
    debugPrint("LoginPageModel");
  }

  void refresh(){
    notifyListeners();
  }

}