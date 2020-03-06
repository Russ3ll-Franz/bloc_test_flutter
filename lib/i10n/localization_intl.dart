import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntlLocalizations {
  static Future<IntlLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    print("name是：$localeName");
    /* return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new IntlLocalizations();
    }); */
  }

  static IntlLocalizations of(BuildContext context) {
    return Localizations.of<IntlLocalizations>(context, IntlLocalizations);
  }

  String get appName{
    return Intl.message("One Day List",name: "appName",desc: "app的名字");
  }

  //LOADING WIDGET
  String get checkYourEmailOrPassword => Intl.message('please check your email account or password', name: 'checkYourEmailOrPassword', desc: '请检查你的邮箱或者密码',);
  String get reLoading => Intl.message('click to reload', name: 'reLoading', desc: '点击重新加载',);
  String get loadingEmpty => Intl.message('nothing at all', name: 'loadingEmpty', desc: '什么都没有哦',);
  String get loadingIdle => Intl.message('...', name: 'loadingIdle', desc: '......',);
  String get loading => Intl.message('loading...', name: 'loading', desc: '加载中...',);



//NET_LOADING_WIDGET
  String get submitSuccess => Intl.message('submit success!', name: 'submitSuccess', desc: '提交成功！',);
  String get submitAgain => Intl.message('submit again', name: 'submitAgain', desc: '重新提交',);
  String get waitAMoment => Intl.message('please wait for a moment...', name: 'waitAMoment', desc: '请稍后...',);
  String get ok => Intl.message('ok', name: 'ok', desc: '确定',);


//LOGIN_PAGES
  String get login => Intl.message('Login', name: 'login', desc: '登录',);

//LOGIN_WIDGET
  String get inputEmail => Intl.message('Ingrese correo', name: 'inputEmail', desc: 'Ingresar su correo',);
  String get inputPassword => Intl.message('Ingrese contraseña', name: 'inputPassword', desc: 'Ingresar su contraseña',);
  String get email => Intl.message('EMAIL', name: 'email', desc: '邮箱',);
  String get password => Intl.message('PASSWORD', name: 'password', desc: '密码',);
  String get logIn => Intl.message('Iniciar Sesion', name: 'logIn', desc: '登 录',);

//LOGIN

  String get emailCantBeEmpty => Intl.message('email cannot be empty', name: 'emailCantBeEmpty', desc: '邮箱不能为空',);
  String get emailIncorrectFormat => Intl.message('email format is incorrect', name: 'emailIncorrectFormat', desc: '邮箱格式不正确',);
  String get passwordCantBeEmpty => Intl.message('password cannot be empty', name: 'passwordCantBeEmpty', desc: '密码不能为空',);
  String get passwordTooShort => Intl.message('password length cannot be less than 8 digits', name: 'passwordTooShort', desc: '密码长度不能小于8位',);
  String get passwordTooLong => Intl.message('password length cannot be greater than 20 digits', name: 'passwordTooLong', desc: '密码长度不能大于20位',);

}
class DemoLocalizationsDelegate extends LocalizationsDelegate<IntlLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<IntlLocalizations> load(Locale locale) {
    //3
    return  IntlLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}