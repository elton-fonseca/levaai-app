class StatusPedido {
  static String pegar(Map pedido) {
    var pagamentos = pedido['pagamentos'];

    if (pedido['status'] == 'criado' && pagamentos.isEmpty) {
      return 'sem-pagamento';
    }

    var pagamento = pagamentos[0];
    if (pedido['status'] == 'criado' &&
        pagamento['forma_pagamento'] == 'boleto') {
      if (DateTime.now()
          .isAfter(DateTime.parse(pagamento['data_vencimento_boleto_juno']))) {
        return 'boleto-vencido';
      }

      return 'aguardando-pagamento-boleto';
    }

    if (pedido['status'] == 'criado' &&
        pagamento['forma_pagamento'] == 'cartao') {
      if (pagamento['status'] == 'pendente') {
        return 'aguardando-pagamento-cartao';
      }
      return 'pagamento-reprovado';
    }

    return pedido['status'];
  }
}
