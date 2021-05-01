import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/pagamento.dart';
import '../../../../core/view/helpers.dart';
import '../../pagamento_controller.dart';

part 'dados_cartao_controller.g.dart';

class DadosCartaoController = _DadosCartaoControllerBase
    with _$DadosCartaoController;

abstract class _DadosCartaoControllerBase with Store {
  @action
  void defineEnderecoFaturamento(String novoEnderecoDestino) {
    //pedidoLista.pedidos[indice].enderecoDestino = novoEnderecoDestino;
  }

  Future<Null> mostraMapa({
    @required BuildContext context,
    @required TextEditingController enderecoTextController,
    @required TextEditingController enderecoNumeroTextController,
    @required TextEditingController enderecoCepTextController,
    @required String nome,
  }) async {
    var pagamento = Modular.get<PagamentoController>().pagamento;
    _limpaCampos(pagamento, enderecoTextController,
        enderecoNumeroTextController, enderecoCepTextController);
  }

  void _preencheCampos(
    Pagamento pagamento,
    String address,
    TextEditingController enderecoTextController,
    TextEditingController enderecoNumeroTextController,
    TextEditingController enderecoCepTextController,
  ) {
    var endereco = Helpers.montaEndereco(address);

    enderecoTextController.text = endereco;
    enderecoNumeroTextController.text = address ?? null;
    enderecoCepTextController.text = address ?? null;

    pagamento.cepFaturamento = address;
    pagamento.logradouroFaturamento = address;
    pagamento.numeroFaturamento = address;
    if (Platform.isAndroid) {
      pagamento.cidadeFaturamento = address;
      pagamento.estadoFaturamento = Helpers.pegarSiglaEstado(address);
    } else {
      pagamento.cidadeFaturamento = address;
      pagamento.estadoFaturamento = address;
    }
  }

  void _limpaCampos(
    Pagamento pagamento,
    TextEditingController enderecoTextController,
    TextEditingController enderecoNumeroTextController,
    TextEditingController enderecoCepTextController,
  ) {
    enderecoTextController.text = '';
    enderecoNumeroTextController.text = '';
    enderecoCepTextController.text = '';

    pagamento.cepFaturamento = '';
    pagamento.logradouroFaturamento = '';
    pagamento.numeroFaturamento = '';
    pagamento.cidadeFaturamento = '';
    pagamento.estadoFaturamento = '';
  }
}
