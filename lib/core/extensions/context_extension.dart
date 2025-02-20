
import 'package:flutter/material.dart';
import '../language/app_localizations.dart';

extension ContextExt on BuildContext {



//Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
  // // images
  // MyAssets get assets => Theme.of(this).extension<MyAssets>()!;
  // //Navigation

  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
