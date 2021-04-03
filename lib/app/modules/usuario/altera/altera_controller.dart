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
  dynamic usuario = Usuario();

  void populaDadosIniciais(
    Map dados,
    TextEditingController telefoneTextController,
    TextEditingController documentoTextController,
    TextEditingController nomeTextController,
    TextEditingController sobrenomeTextController,
    TextEditingController emailTextController,
  ) {
    defineTipoPessoa(dados['tipo'], documentoTextController);

    documentoTextController.text = dados['documento'];
    telefoneTextController.text = dados['telefone'];
    nomeTextController.text = dados['name'];
    sobrenomeTextController.text = dados['sobrenome'];
    emailTextController.text = dados['email'];

    usuario.documento = dados['documento'];
    usuario.telefone = dados['telefone'];
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
  void defineNome(String value) {
    usuario.nomeFantasia = value;
  }

  @action
  void defineSobrenome(String value) {
    usuario.sobrenomeRazao = value;
  }

  @action
  void defineDocumento(String value) {
    usuario.documento = value;
  }

  @action
  void defineTelefone(String value) {
    usuario.telefone = value;
  }

  @action
  void defineEmail(String value) {
    usuario.email = value;
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
