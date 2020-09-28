import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/pagamento.dart';
import '../../core/stores/pedido_lista_store.dart';
import '../../core/view/helpers.dart';
import '../pedido/repositories/pedido_repository.dart';
import 'repositories/pagamento_repository.dart';
import 'validacao/valida_formulario.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  @observable
  Pagamento pagamento = Pagamento();

  void enviar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      var pedidoLista = Modular.get<PedidoListaStore>();
      var pedidosJson = jsonEncode(pedidoLista.pedidosCompletosJson());

      Modular.get<PedidoRepository>().cadastrar(pedidosJson).then((pedidosIds) {
        pedidoLista.populaIdsPedidos(pedidosIds);

        var json = jsonEncode(pagamento.pagamentoParaJson());

        Modular.get<PagamentoRepository>().cadastrar(json).then((resposta) {
          Modular.to.popAndPushNamed('rastreamento/lista');
        }).catchError((e) {
          Helpers.snackLevaai(texto: "Erro no pagamento", context: context);
        });
      }).catchError((e) {
        Helpers.snackLevaai(texto: "Erro ao criar pedidos", context: context);
      });

      //Modular.to.pushNamed('/rastreamento/lista');
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

  void defineCamposValores({
    @required MaskedTextController numeroCartaoTextController,
    @required MaskedTextController validadeTextController,
    @required MaskedTextController codigoSegurancaTextController,
  }) {
    numeroCartaoTextController.afterChange = (previous, next) {
      pagamento.numeroCartao = previous;
      return true;
    };

    validadeTextController.afterChange = (previous, next) {
      pagamento.validade = previous;
      return true;
    };

    codigoSegurancaTextController.afterChange = (previous, next) {
      pagamento.codigoSeguranca = previous;
      return true;
    };
  }
}
