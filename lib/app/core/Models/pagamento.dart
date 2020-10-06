import 'package:flutter_modular/flutter_modular.dart';
import 'package:juno_direct_checkout/juno_direct_checkout.dart';
import 'package:mobx/mobx.dart';

import '../services/validadores.dart';
import '../stores/pedido_lista_store.dart';

part 'pagamento.g.dart';

class Pagamento = _PagamentoBase with _$Pagamento;

abstract class _PagamentoBase with Store {
  @observable
  String tipoPagamento = 'cartao';

  String nome;
  String numeroCartao;

  String validade;
  String codigoSeguranca;

  String cepFaturamento;
  String logradouroFaturamento;
  String numeroFaturamento;
  String cidadeFaturamento;
  String estadoFaturamento;

  Future<Map<String, dynamic>> pagamentoParaJson() async {
    final data = <String, dynamic>{};
    data['valor'] = Modular.get<PedidoListaStore>().valorTotalPedidos / 25;
    data['forma_pagamento'] = tipoPagamento;
    data['pedidos'] = Modular.get<PedidoListaStore>().pedidosIds();

    if (tipoPagamento == 'cartao') {
      var map = <String, dynamic>{
        "prod": false,
        "public_token":
            "74E3B38F32887008B8CDB0B727DACC7F6E7FB161DEC8211C1B24B0B5F17F6793"
      };
      print(await JunoDirectCheckout.init(map));
      var card = <String, dynamic>{
        "prod": false,
        "public_token":
            "74E3B38F32887008B8CDB0B727DACC7F6E7FB161DEC8211C1B24B0B5F17F6793",
        "cardNumber": numeroCartao,
        "holderName": nome,
        "securityCode": codigoSeguranca,
        "expirationMonth":
            validade[0] == '0' ? validade[1] : '${validade[0]}${validade[1]}',
        "expirationYear": '20${validade[3]}${validade[4]}'
      };
      data['hash_cartao'] = await JunoDirectCheckout.getCardHash(card);

      //data['numero_cartao'] = Validadores.limpaMascara(numeroCartao);
      data['nome_cartao'] = nome;
      //data['validade_cartao'] = validade;
      //data['codigo_seguranca_cartao'] = codigoSeguranca;
    }

    return data;
  }
}
