import 'package:Levaai/app/core/view/helpers.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../status_pedido.dart';
import '../../detalhes_controller.dart';

class TratarItensRastreamento {
  String status;

  double valorExibicaoDouble;
  String valorExibicao;

  Map pedidoPropriedade;

  List executar(Map pedido) {
    status = StatusPedido.pegar(pedido);
    pedidoPropriedade = pedido;

    valorExibicaoDouble = _defineValor();
    valorExibicao = 'R\$ ${Helpers.numeroBr(valorExibicaoDouble)}';

    _semPagamento();
    _imprimirBoleto();
    _boletoVencido();
    _cartaoEmAnalise();
    _pagamentoReprovado();

    _reentrega();

    return pedidoPropriedade['rastreamento'];
  }

  double _defineValor() {
    var cotacaoDouble =
        double.parse(pedidoPropriedade['cotacao']['valor_calculado_cotacao']);

    if (status == 'sem-pagamento') {
      if (pedidoPropriedade['primeira_contratacao'] == true) {
        return cotacaoDouble - 5;
      }

      return cotacaoDouble;
    }

    if (pedidoPropriedade['reentrega'] != 0) {
      return cotacaoDouble;
    }

    return double.parse(pedidoPropriedade['pagamentos'][0]['valor']) -
        double.parse(pedidoPropriedade['pagamentos'][0]['desconto']);
  }

  void _semPagamento() {
    if (status == 'sem-pagamento') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": true,
        "botao_mensagem": "Pagar",
        "botao_acao": () => Modular.get<DetalhesController>()
            .chamarPagamentoPedido(pedidoPropriedade, 'posterior'),
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem":
            // ignore: lines_longer_than_80_chars
            "Você ainda não realizou o pagamento no valor de $valorExibicaoDouble",
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
        "mensagem": 'Não identificamos o pagamento'
            ' do seu boleto no valor de $valorExibicaoDouble',
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _boletoVencido() {
    if (status == 'boleto-vencido') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.vermelho,
        "mensagem": "Boleto Vencido no valor de $valorExibicaoDouble",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _cartaoEmAnalise() {
    if (status == 'aguardando-pagamento-cartao') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.amarelo,
        "mensagem":
            "O pagamento no valor de $valorExibicaoDouble está em Análise",
        "data": DateTime.now().toIso8601String()
      });
    }
  }

  void _pagamentoReprovado() {
    if (status == 'pagamento-reprovado') {
      pedidoPropriedade['rastreamento'].insert(0, {
        "botao": false,
        "cor_bolinha": StatusPedido.vermelho,
        "mensagem":
            "O pagamento no valor de $valorExibicaoDouble não foi aprovado",
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
        "mensagem":
            "Realizar pagamento da reentrega no valor de $valorExibicaoDouble",
        "data": DateTime.now().toIso8601String()
      });
    }
  }
}
