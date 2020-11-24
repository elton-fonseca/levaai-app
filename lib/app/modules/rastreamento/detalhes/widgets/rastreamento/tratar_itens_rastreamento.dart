import 'package:flutter_modular/flutter_modular.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../status_pedido.dart';
import '../../detalhes_controller.dart';

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
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": true,
        "botao_mensagem": "Pagar",
        "botao_acao": () => Modular.get<DetalhesController>()
            .chamarPagamentoPedido(pedidoPropriedade, 'posterior'),
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem": "Você ainda não realizou o pagamento desse pedido",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _imprimirBoleto() {
    if (status == 'aguardando-pagamento-boleto') {
      pedidoPropriedade['rastreamento'].insert(0, {
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
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem": "Ainda não identificamos o pagamento do seu boleto",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _boletoVencido() {
    if (status == 'boleto-vencido') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.vermelho,
        "mensagem": "Boleto Vencido",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _cartaoEmAnalise() {
    if (status == 'aguardando-pagamento-cartao') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem": "Pagamento em Análise",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _pagamentoReprovado() {
    if (status == 'pagamento-reprovado') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.vermelho,
        "mensagem": "Pagamento não aprovado",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _reentrega() {
    if (status == 'entrega-nao-efetuada-cliente') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": true,
        "botao_mensagem": "Pagar",
        "botao_acao": () => Modular.get<DetalhesController>()
            .chamarPagamentoPedido(pedidoPropriedade, 'reentrega'),
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem": "Realizar pagamento da reentrega",
        "data": DateTime.now().toIso8601String()
      });
    }
  }
}
