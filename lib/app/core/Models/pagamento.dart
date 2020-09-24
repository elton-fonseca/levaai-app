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
    data['valor'] = 2500.24;
    data['forma_pagamento'] = tipoPagamento;

    data['numero_cartao'] = Validadores.limpaMascara(numeroCartao);
    data['nome_cartao'] = nome;
    data['validade_cartao'] = validade;
    data['codigo_seguranca_cartao'] = numeroCartao;
    data['pedidos'] = [1, 2, 3];

    return data;
  }
}
