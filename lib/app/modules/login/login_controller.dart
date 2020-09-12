import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'repositories/login_repository.dart';

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
      // Modular.get<LoginRepository>().fetchPost().then((value) => print(value));
    }

    return null;
  }
}
