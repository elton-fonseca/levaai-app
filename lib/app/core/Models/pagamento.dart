import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/stores/pedido_lista_store.dart';

import '../services/validadores.dart';
import 'package:mobx/mobx.dart';

part 'pagamento.g.dart';

class Pagamento = _PagamentoBase with _$Pagamento;

abstract class _PagamentoBase with Store {
  @observable
  String tipoPagamento = 'cartao';

  String nome;
  String numeroCartao;

  String validade;
  String codigoSeguranca;

  Map<String, dynamic> pagamentoParaJson() {
    final data = <String, dynamic>{};
    data['valor'] = Modular.get<PedidoListaStore>().valorTotalPedidos;
    data['forma_pagamento'] = tipoPagamento;
    data['pedidos'] = Modular.get<PedidoListaStore>().pedidosIds();

    if (tipoPagamento == 'cartao') {
      data['numero_cartao'] = Validadores.limpaMascara(numeroCartao);
      data['nome_cartao'] = nome;
      data['validade_cartao'] = validade;
      data['codigo_seguranca_cartao'] = codigoSeguranca;
    }

    return data;
  }
}
