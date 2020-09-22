import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/pagamento.dart';
import '../../core/view/helpers.dart';
import 'validacao/valida_formulario.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  @observable
  Pagamento pagamento = Pagamento();

  void enviar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      Modular.to.pushNamed('/rastreamento/lista');
      return;
    }

    Helpers.snackLevaai(texto: valido, context: context);
  }

  // ignore: use_setters_to_change_properties
  @action
  void defineTipoPagamento(String novoTipoPagamento) {
    pagamento.tipoPagamento = novoTipoPagamento;
  }

  String pegaTipoPagamento() {
    if (pagamento.tipoPagamento != null) {
      return pagamento.tipoPagamento;
    }

    return "cartao";
  }
}
