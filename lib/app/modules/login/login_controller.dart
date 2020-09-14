import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

//import '../../core/services/local_storage.dart';
import 'repositories/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email;

  @observable
  String senha;

  // ignore: use_setters_to_change_properties
  @action
  void defineEmail(String emailNovo) => email = emailNovo;

  // ignore: use_setters_to_change_properties
  @action
  void defineSenha(String senhaNova) => senha = senhaNova;

  VoidCallback login(GlobalKey<FormState> formKey, BuildContext context) {
    if (formKey.currentState.validate()) {
      Modular.get<LoginRepository>().login(email, senha).then((value) {
        //LocalStorage.setValue<String>('token',value);
        print(email + senha);
      }).catchError((e) {
        var scnackbar = SnackBar(
          content: Text("Usuário ou senha invalidos"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        );
        Scaffold.of(context).showSnackBar(scnackbar);
      });
    }

    return null;
  }
}
