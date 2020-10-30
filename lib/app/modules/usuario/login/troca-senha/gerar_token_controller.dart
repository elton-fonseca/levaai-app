import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/view/helpers.dart';
import '../../repositories/usuario_repository.dart';

part 'gerar_token_controller.g.dart';

class GerarTokenController = _GerarTokenControllerBase
    with _$GerarTokenController;

abstract class _GerarTokenControllerBase with Store {
  String token;
  String telefone;

  void obterToken(BuildContext context) {
    if (_validaTelefone() == '') {
      Modular.get<UsuarioRepository>().obterToken(telefone).then((resposta) {
        token = resposta;

        Modular.to.pushNamed('/login/trocar/senha/form');
      }).catchError((e) {
        var mensagem = 'Erro ao enviar código de validação';

        if (e.response.statusCode == 302) {
          mensagem = 'Telefone Não Encontrado no Sistema';
        }

        Helpers.snackLevaai(texto: mensagem, context: context);
      });
    } else {
      Helpers.snackLevaai(texto: _validaTelefone(), context: context);
    }
  }

  String _validaTelefone() {
    if (telefone == null || telefone.isEmpty) {
      return 'Informe o Celular\n';
    }

    if (telefone.length < 15) {
      return 'Informe Corretamente\n';
    }

    return '';
  }

  void limpar() {
    token = null;
    telefone = null;
  }
}
