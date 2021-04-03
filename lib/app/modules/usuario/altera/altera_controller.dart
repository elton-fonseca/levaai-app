import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/usuario.dart';
import '../../../core/view/helpers.dart';
import '../repositories/usuario_repository.dart';
import 'validacao/valida_formulario.dart';

part 'altera_controller.g.dart';

class AlteraController = _AlteraControllerBase with _$AlteraController;

abstract class _AlteraControllerBase with Store {
  @observable
  Usuario usuario = Usuario(); 

  void populaDadosIniciais(
    Map dados,
    TextEditingController telefoneTextController,
    TextEditingController documentoTextController,
  ) {
    telefoneTextController.text = dados['telefone'];
    documentoTextController.text = dados['documento'];
    usuario.nomeFantasia = dados['name'];
    usuario.sobrenomeRazao = dados['sobrenome'];
    usuario.email = dados['email'];
  }

  void enviar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      var json = jsonEncode(usuario.usuarioAlterarParaJson());

      Modular.get<UsuarioRepository>().alterar(json).then((resposta) {
        Helpers.alerta(
          titulo: "Aviso",
          context: context,
          descricao: 'Dados alterados com sucesso',
        );
      }).catchError((e) {
        Helpers.snackLevaai(
          context: context,
          texto: Helpers.mensagemValidacaoAPI(e, 'Erro ao Alterar'),
        );
      });

      return;
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

  void defineCamposValores({
    @required MaskedTextController documentoTextController,
    @required MaskedTextController telefoneTextController,
  }) {
    documentoTextController.afterChange = (previous, next) {
      usuario.documento = next;
      return true;
    };

    telefoneTextController.afterChange = (previous, next) {
      usuario.telefone = next;
      return true;
    };
  }

  @action
  void _atualizaMascaraDocumento(MaskedTextController controller) {
    var mascara = pj() ? '00.000.000/0000-00' : '000.000.000-00';

    controller.updateMask(mascara);
  }
}
