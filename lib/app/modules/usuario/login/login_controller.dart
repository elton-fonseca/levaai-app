import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/services/local_storage.dart';
import '../repositories/usuario_repository.dart';

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

  VoidCallback login(
      GlobalKey<FormState> formKey, BuildContext context, String destino) {
    if (formKey.currentState.validate()) {
      Modular.get<UsuarioRepository>().login(email, senha).then((resposta) {
        LocalStorage.setValue<String>(
            'usuario', jsonEncode(resposta["usuario"]));

        LocalStorage.setValue<String>('token', resposta["token"]).then((_) {
          Modular.get<Dio>().options.headers["Authorization"] =
              'Bearer ${resposta["token"]}';

          if (destino == 'pagamento') {
            Navigator.of(context).pop();
            Modular.to.popAndPushNamed('/pagamento/criar');
            return;
          }

          Modular.to.popUntil(ModalRoute.withName('/home'));
          Modular.to.popAndPushNamed('/rastreamento/lista');
        });
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
