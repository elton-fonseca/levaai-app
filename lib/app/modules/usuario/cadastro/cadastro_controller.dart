import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/services/local_storage.dart';
import 'package:levaai1/app/modules/usuario/repositories/usuario_repository.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/usuario.dart';
import '../../../core/view/helpers.dart';
import 'validacao/valida_formulario.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  Usuario usuario = Usuario();

  void enviar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      var json = jsonEncode(usuario.usuarioParaJson());

      Modular.get<UsuarioRepository>().cadastrar(json).then((resposta) {
        LocalStorage.setValue<String>('token', resposta["token"]).then((_) {
          Modular.get<Dio>().options.headers["Authorization"] =
              'Bearer ${resposta["token"]}';
          Modular.to.popAndPushNamed('/pagamento');
        });
      }).catchError((e) {
        Helpers.snackLevaai(context: context, texto: "Erro ao criar Usuário");
      });
    }

    Helpers.snackLevaai(texto: valido, context: context);
  }

  @action
  void defineTipoPessoa(
    String novotipoPessoa,
    MaskedTextController controller,
  ) {
    usuario.tipoPessoa = novotipoPessoa;
    _atualizaMascaraDocumento(controller);
  }

  String pegaTipoPessoa() {
    if (usuario.tipoPessoa != null) {
      return usuario.tipoPessoa;
    }

    return "PF";
  }

  bool pj() {
    return usuario.tipoPessoa == 'PJ';
  }

  @action
  void _atualizaMascaraDocumento(MaskedTextController controller) {
    var mascara = pj() ? '00.000.000/0000-00' : '000.000.000-00';

    controller.updateMask(mascara);
  }
}
