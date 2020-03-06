import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:provider/provider.dart';
import 'package:test_bloc/i10n/localization_intl.dart';
import 'package:test_bloc/modelo/global_model.dart';
import 'package:test_bloc/widgets/login_widget.dart';
import 'package:test_bloc/modelo/login_m.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginPageModel>(context)..setContext(context);
    final globalModel = Provider.of<GlobalModel>(context);
    //final bgColor = globalModel.logic.getBgInDark();


    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "LOGINs",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        leading: model.isFirst
            ? Container()
            : IconButton(
                icon: Icon(Platform.isAndroid
                    ? Icons.arrow_back
                    : Icons.arrow_back_ios, color: Colors.black,),
                onPressed: model.logic.onExit,
              ),
      ),
      body: Stack(
        children: <Widget>[
          FlareActor(
            "flrs/login_bg.flr",
            //animation: model.currentAnimation,
            fit: BoxFit.cover,
            callback: (animation) {
              if (animation == "move") {
                model.currentAnimation = "rotate";
                model.refresh();
              } else if (animation == "move_out") {
                Navigator.of(context).pop();
              }
            },
          ),
          model.showLoginWidget
              ? LoginWidget(
                  loginPageModel: model,
                )
              : Container(),
        ],
      ),
    );
  }
}
