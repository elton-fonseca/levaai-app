import 'package:flutter/material.dart';

class StatusPedido {
  static const amarelo = Color.fromRGBO(229, 185, 29, 1);
  static const verde = Color.fromRGBO(152, 193, 28, 1);
  static const vermelho = Color.fromRGBO(193, 58, 28, 1);

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

  // ignore: missing_return
  static String descritivo(Map pedido) {
    if (pegar(pedido) == 'pago' && pedido['reentrega'] == 1) {
      return 'Aguardando nova entrega';
    }

    switch (pegar(pedido)) {
      case 'sem-pagamento':
        return 'Aguardando pagamento';
        break;
      case 'boleto-vencido':
        return 'Boleto Vencido';
        break;
      case 'pagamento-reprovado':
        return 'Pagamento não aprovado';
        break;
      case 'aguardando-pagamento-boleto':
        return 'Aguardando pagamento Boleto';
        break;
      case 'aguardando-pagamento-cartao':
        return 'Pagamento em análise';
        break;
      case 'pago':
        return 'Pedido Pago';
        break;
      case 'aguardando-coleta':
        return 'Aguardando coleta';
        break;
      case 'transportando':
        return 'Pedido em Transporte';
        break;
      case 'entrega-nao-efetuada-cliente':
        return 'Entrega não efetuada, necessário atenção!';
        break;
      case 'entrega-nao-efetuada-interna':
        return 'Aguardando nova entrega';
        break;
      case 'entrega-efetuada':
        return 'Entrega Efetuada (concluído)';
        break;
    }
  }

  // ignore: missing_return
  static Color cor(Map pedido) {
    switch (pegar(pedido)) {
      case 'sem-pagamento':
        return amarelo;
        break;
      case 'boleto-vencido':
        return vermelho;
        break;
      case 'pagamento-reprovado':
        return vermelho;
        break;
      case 'aguardando-pagamento-boleto':
        return amarelo;
        break;
      case 'aguardando-pagamento-cartao':
        return amarelo;
        break;
      case 'pago':
        return verde;
        break;
      case 'aguardando-coleta':
        return verde;
        break;
      case 'transportando':
        return verde;
        break;
      case 'entrega-nao-efetuada-cliente':
        return vermelho;
        break;
      case 'entrega-nao-efetuada-interna':
        return verde;
        break;
      case 'entrega-efetuada':
        return verde;
        break;
    }
  }

  // ignore: missing_return
  static String imagem(Map pedido) {
    switch (pegar(pedido)) {
      case 'sem-pagamento':
        return 'pedido-aguardando.png';
        break;
      case 'boleto-vencido':
        return 'pedido-atencao.png';
        break;
      case 'pagamento-reprovado':
        return 'pedido-atencao.png';
        break;
      case 'aguardando-pagamento-boleto':
        return 'pedido-aguardando.png';
        break;
      case 'aguardando-pagamento-cartao':
        return 'pedido-aguardando.png';
        break;
      case 'pago':
        return 'sem-imagem';
        break;
      case 'aguardando-coleta':
        return 'sem-imagem';
        break;
      case 'transportando':
        return 'sem-imagem';
        break;
      case 'entrega-nao-efetuada-cliente':
        return 'pedido-aguardando.png';
        break;
      case 'entrega-nao-efetuada-interna':
        return 'sem-imagem';
        break;
      case 'entrega-efetuada':
        return 'pedido-ok.png';
        break;
    }
  }
}
