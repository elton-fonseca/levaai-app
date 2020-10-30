import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/view/helpers.dart';
import '../../repositories/usuario_repository.dart';
import 'gerar_token_controller.dart';

part 'alterar_senha_controller.g.dart';

class AlterarSenhaController = _AlterarSenhaControllerBase
    with _$AlterarSenhaController;

abstract class _AlterarSenhaControllerBase with Store {
  String tokenDigitado;
  String senha;
  String senhaConfirmacao;

  void alterarSenha(BuildContext context) {
    if (_validar() == '') {
      var telefone = Modular.get<GerarTokenController>().telefone;
      Modular.get<UsuarioRepository>()
          .alterarSenha(telefone, senha)
          .then((resposta) {
        return (showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Confirmação'),
                content: Text('Senha Alterada com Sucesso'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context)..pop()..pop()..pop();
                      Modular.to.pushNamed('/login/formulario/lista-pedidos');
                    },
                    child: Text('Sim'),
                  ),
                ],
              ),
            )) ??
            false;
      }).catchError((e) {
        Helpers.snackLevaai(
            texto: "Erro ao definir nova senha", context: context);
      });
    } else {
      Helpers.snackLevaai(texto: _validar(), context: context);
    }
  }

  String _validar() {
    var token = Modular.get<GerarTokenController>().token;
    print(token);
    if (tokenDigitado == null || tokenDigitado != token) {
      return 'Código de confirmação inválido\n';
    }

    if (senha == null || senha.length < 8) {
      return 'A senha deve conter no mínimo 8 caracteres\n';
    }

    if (senha != senhaConfirmacao) {
      return 'Confirmação de senha incorreta\n';
    }

    return '';
  }

  void limpar() {
    tokenDigitado = null;
    senha = null;
    senhaConfirmacao = null;
  }
}
