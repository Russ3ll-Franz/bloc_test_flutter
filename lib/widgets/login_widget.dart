import 'package:flutter/material.dart';
import 'package:test_bloc/i10n/localization_intl.dart';
import 'package:test_bloc/modelo/login_m.dart';
import 'package:test_bloc/widgets/bottom_to_top_widget.dart';

class LoginWidget extends StatelessWidget {
  final LoginPageModel loginPageModel;

  const LoginWidget({Key key, @required this.loginPageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final primaryColorLight = Theme.of(context).primaryColorLight;
    final primaryColorDark = Theme.of(context).primaryColorDark;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Form(
        key: loginPageModel.formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomToTopWidget(
                  child: TextFormField(
                     validator: (email) =>
                        loginPageModel.logic.validatorEmail(email),
                    keyboardType: TextInputType.text,
                    controller: loginPageModel.emailController,
                    style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                        hintText: 'IntlLocalizations.of(context).inputEmail',
                        labelText: 'IntlLocalizations.of(context).email',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () => Future.delayed(
                            Duration(milliseconds: 100),
                            () => loginPageModel.emailController?.clear(),
                          ),
                        )),
                ), index: 0,
                ),
                 BottomToTopWidget(
                  child: TextFormField(
                    validator: (password) =>
                        loginPageModel.logic.validatePassword(password),
                    controller: loginPageModel.passwordController,
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),
                    obscureText: true,
                  ),
                  index: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                BottomToTopWidget(
                  index: 3,
                  child: Container(
                    height: 60,
                    width: size.width - 80,
                    child: FlatButton(
                      color: primaryColor,
                      highlightColor: primaryColorLight,
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text(
                        'LOGEAR',
                        //,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      onPressed: loginPageModel.logic.onLogin,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}