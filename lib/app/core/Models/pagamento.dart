import 'package:flutter_modular/flutter_modular.dart';
import 'package:juno_direct_checkout/juno_direct_checkout.dart';
import 'package:mobx/mobx.dart';

import '../stores/pedido_lista_store.dart';

part 'pagamento.g.dart';

class Pagamento = _PagamentoBase with _$Pagamento;

abstract class _PagamentoBase with Store {
  String cobrancaJunoID;

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
    data['valor'] = Modular.get<PedidoListaStore>().valorTotalPedidos;// / 25;
    data['forma_pagamento'] = tipoPagamento;
    data['pedidos'] = Modular.get<PedidoListaStore>().pedidosIds();

    if (tipoPagamento == 'cartao') {
      if (cobrancaJunoID != null) {
        data['cobranca_id_juno'] = cobrancaJunoID;
      }

      var map = <String, dynamic>{
        "prod": true,
        "public_token":
            // ignore: lines_longer_than_80_chars
            "6ACED7F1E439E19818D45373E0102750AA2EF1DC2CD7BF3E6E6C3534EE52957A46F70701D567EA44"
        //"74E3B38F32887008B8CDB0B727DACC7F6E7FB161DEC8211C1B24B0B5F17F6793"
      };

      var card = <String, dynamic>{
        "prod": true,
        "public_token":
            // ignore: lines_longer_than_80_chars
            "6ACED7F1E439E19818D45373E0102750AA2EF1DC2CD7BF3E6E6C3534EE52957A46F70701D567EA44",
        //"74E3B38F32887008B8CDB0B727DACC7F6E7FB161DEC8211C1B24B0B5F17F6793",
        "cardNumber": numeroCartao,
        "holderName": nome,
        "securityCode": codigoSeguranca,
        "expirationMonth":
            validade[0] == '0' ? validade[1] : '${validade[0]}${validade[1]}',
        "expirationYear": '20${validade[3]}${validade[4]}'
      };

      await JunoDirectCheckout.init(map);
      data['hash_cartao'] = await JunoDirectCheckout.getCardHash(card);
      data['nome_cartao'] = nome;

      data['cep_endereco_faturamento'] = cepFaturamento;
      data['logradouro_endereco_faturamento'] = logradouroFaturamento;
      data['numero_endereco_faturamento'] = numeroFaturamento;
      data['cidade_endereco_faturamento'] = cidadeFaturamento;
      data['estado_endereco_faturamento'] = estadoFaturamento;
    }

    return data;
  }
}
