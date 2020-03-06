import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bloc/config/provider_config.dart';
import 'package:test_bloc/modelo/global_model.dart';
import 'package:test_bloc/pages/home/splash_page.dart';

void main() => runApp(ProviderConfig.getInstance().getGlobal(MyApp()));



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);
    return MaterialApp(
      title: 'Allemant Peritos Valuadores',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: getHomePage(model.goToLogin, model.enableSplashAnimation),
    );
  }

 Widget getHomePage(bool goToLogin, bool enableSplashAnimation){
    if(goToLogin == null) return Container();
    if(enableSplashAnimation) return new SplashPage();
    return goToLogin ? ProviderConfig.getInstance().getLoginPage(isFirst: true)
        : ProviderConfig.getInstance().getMainPage();
  }
}
