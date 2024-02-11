import 'package:flutter/material.dart';

class UserProviderClass extends ChangeNotifier {
  String _name = "Joshua";
  String get name => _name;

  void changeTolastName() {
    _name = "Gasasira";
    notifyListeners();
  }

  void changeTofirstName() {
    _name = "Joshua";
    notifyListeners();
  }
}
