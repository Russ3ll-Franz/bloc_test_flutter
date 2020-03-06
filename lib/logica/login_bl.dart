import 'package:test_bloc/config/api_service.dart';
import 'package:test_bloc/i10n/localization_intl.dart';
import 'package:test_bloc/json/login_api.dart';
import 'package:test_bloc/modelo/login_m.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/utils/shared_util.dart';
import 'package:test_bloc/widgets/net_loading_widget.dart';

class LoginPageLogic {
  final LoginPageModel _model;

  LoginPageLogic(this._model);

  void onExit() {
    _model.refresh();
  }

  String validatorEmail(String email) {
    final context = _model.context;
    _model.isEmailOk = false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email.isEmpty)
      return 'email cannot be empty';
    else if (!regex.hasMatch(email))
      return 'email format is incorrect';
    else {
      _model.isEmailOk = true;
      return null;
    }
  }

  String validatePassword(String password) {
    final context = _model.context;
    _model.isPasswordOk = false;
    if (password.isEmpty) {
      return 'password cannot be empty';
    } else if (password.length < 8) {
      return 'password length cannot be less than 8 digits';
    } else if (password.length > 20) {
      return 'password length cannot be greater than 20 digits';
    } else {
      _model.isPasswordOk = true;
      return null;
    }
  }

  void onLogin() {
    final context = _model.context;
    _model.formKey.currentState.validate();
    if (!_model.isEmailOk || !_model.isPasswordOk) {
      _showDialog('Password', context);
      return;
    }
    showDialog(context: _model.context, builder: (ctx){
      return NetLoadingWidget();
    });
    _onLoginRequest(context);
  }

  void _showDialog(String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            content: Text(text),
          );
        });
  }


  void _onLoginRequest(BuildContext context) {

    final email = _model.emailController.text;
    final password = _model.passwordController.text;
    //final encryptPassword = EncryptUtil.instance.encrypt(password);

     ApiService.instance.login(
      params: {
        "email": "$email",
        "password": "$password"
      },
      success: (LoginBean loginBean) {
          SharedUtil.instance.saveString(Keys.email, email).then((value){
          SharedUtil.instance.saveString(Keys.password, password);
          SharedUtil.instance.saveString(Keys.token, loginBean.token);
          SharedUtil.instance.saveBoolean(Keys.hasLogged, true);
        }).then((v){
          print("Logeado");
        });
      },
      failed: (LoginBean loginBean) {
        Navigator.of(context).pop();
        _showDialog(loginBean.token, context);
      },
      error: (msg) {
        Navigator.of(context).pop();
        _showDialog(msg, context);
      },
      token: _model.cancelToken,
    );
  } 
}