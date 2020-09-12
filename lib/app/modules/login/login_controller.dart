import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  VoidCallback login(GlobalKey<FormState> formKey) {
    if (formKey.currentState.validate()) {
      print('valido');
    } else {
      print('in');
    }

    return null;
  }
}
