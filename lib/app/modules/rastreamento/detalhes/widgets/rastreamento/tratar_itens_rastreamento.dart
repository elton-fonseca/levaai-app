import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../pagamento/pagamento_controller.dart';
import '../../../status_pedido.dart';

class TratarItensRastreamento {
  String status;

  Map pedidoPropriedade;

  List executar(Map pedido) {
    status = StatusPedido.pegar(pedido);
    pedidoPropriedade = pedido;

    _semPagamento();
    _imprimirBoleto();
    _boletoVencido();
    _cartaoEmAnalise();
    _pagamentoReprovado();

    _reentrega();

    return pedidoPropriedade['rastreamento'];
  }

  void _semPagamento() {
    if (status == 'sem-pagamento') {
      pedidoPropriedade['rastreamento'].add({
        "botao": true,
        "botao_mensagem": "Pagar",
        "botao_acao": () => Modular.get<PagamentoController>()
            .chamarPagamentoPedido(pedidoPropriedade, 'posterior'),
        "cor_bolinha": Colors.yellowAccent,
        "mensagem": "Você ainda não realizou o pagamento desse pedido",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _imprimirBoleto() {
    if (status == 'aguardando-pagamento-boleto') {
      pedidoPropriedade['rastreamento'].add({
        "botao": true,
        "botao_mensagem": "Baixar Boleto",
        "botao_acao": () async {
          var url = pedidoPropriedade['pagamentos'][0]['boleto_url_juno'];
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Boleto não encontrado';
          }
        },
        "cor_bolinha": Colors.yellowAccent,
        "mensagem": "Ainda não identificamos o pagamento do seu boleto",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _boletoVencido() {
    if (status == 'boleto-vencido') {
      pedidoPropriedade['rastreamento'].add({
        "botao": false,
        "cor_bolinha": Colors.red,
        "mensagem": "Boleto Vencido ou Aguardando Compensação",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _cartaoEmAnalise() {
    if (status == 'aguardando-pagamento-cartao') {
      pedidoPropriedade['rastreamento'].add({
        "botao": false,
        "cor_bolinha": Colors.yellowAccent,
        "mensagem": "Pagamento em Análise",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _pagamentoReprovado() {
    if (status == 'pagamento-reprovado') {
      pedidoPropriedade['rastreamento'].add({
        "botao": false,
        "cor_bolinha": Colors.red,
        "mensagem": "Pagamento não aprovado",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _reentrega() {
    if (status == 'entrega-nao-efetuada-cliente') {
      pedidoPropriedade['rastreamento'].add({
        "botao": true,
        "botao_mensagem": "Pagar",
        "botao_acao": () => Modular.get<PagamentoController>()
            .chamarPagamentoPedido(pedidoPropriedade, 'reentrega'),
        "cor_bolinha": Colors.yellowAccent,
        "mensagem": "Realizar pagamento da reentrega",
        "data": DateTime.now().toIso8601String()
      });
    }
  }
}
