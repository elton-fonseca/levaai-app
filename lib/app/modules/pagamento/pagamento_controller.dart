import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/models/pagamento.dart';
import '../../core/models/pedido.dart';
import '../../core/stores/pedido_lista_store.dart';
import '../../core/view/botao_branco.dart';
import '../../core/view/helpers.dart';
import '../pedido/repositories/pedido_repository.dart';
import 'repositories/pagamento_repository.dart';
import 'validacao/valida_formulario.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  @observable
  Pagamento pagamento = Pagamento();

  Map pagamentoApiResponse;

  void criarPedidos() {
    var pedidoLista = Modular.get<PedidoListaStore>();
    var pedidosJson = jsonEncode(pedidoLista.pedidosCompletosJson());

    Modular.get<PedidoRepository>().cadastrar(pedidosJson).then((pedidosIds) {
      pedidoLista.populaIdsPedidos(pedidosIds);
    });
  }

  void pagar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      pagamento.pagamentoParaJson().then((pagamentoMap) {
        var json = jsonEncode(pagamentoMap);

        Modular.get<PagamentoRepository>().cadastrar(json).then((resposta) {
          if (pagamento.tipoPagamento == 'cartao' &&
              resposta['status'] == 'reprovado') {
            pagamento.cobrancaJunoID = resposta['cobranca_id_juno'];
            Helpers.snackLevaai(
                texto: resposta['pagamento_id_juno'], context: context);
          } else {
            pagamentoApiResponse = resposta;
            Modular.to.pushNamed('pagamento/confirmacao');
          }
        }).catchError((e) {
          Helpers.snackLevaai(
              texto: "Erro no pagamento  ${e.message} ${e.response.data}",
              context: context);
        });
      });

      return;
    }

    Helpers.snackLevaai(texto: valido, context: context);
  }

  void chamarPagamentoPedido(Map pedido, String tipo) {
    var listaPedido = Modular.get<PedidoListaStore>();
    var pedidoObjeto = Pedido();
    pedidoObjeto.idPedido = pedido['id'];

    listaPedido.pedidos.add(pedidoObjeto);

    listaPedido.valorTotalPedidos =
        double.parse(pedido['cotacao']['valor_calculado_cotacao']);

    Modular.to.popAndPushNamed('/pagamento/$tipo');
  }

  // ignore: use_setters_to_change_properties
  @action
  void defineTipoPagamento(String novoTipoPagamento) {
    pagamento.tipoPagamento = novoTipoPagamento;
  }

  String pegaTipoPagamento() {
    if (pagamento.tipoPagamento != null) {
      return pagamento.tipoPagamento;
    }

    return "cartao";
  }

  void defineCamposValores({
    @required MaskedTextController numeroCartaoTextController,
    @required MaskedTextController validadeTextController,
    @required MaskedTextController codigoSegurancaTextController,
  }) {
    numeroCartaoTextController.afterChange = (previous, next) {
      pagamento.numeroCartao = previous;
      return true;
    };

    validadeTextController.afterChange = (previous, next) {
      pagamento.validade = next;
      return true;
    };

    codigoSegurancaTextController.afterChange = (previous, next) {
      pagamento.codigoSeguranca = next;
      return true;
    };
  }

  IconData confirmacaoIcone() {
    if (pagamento.tipoPagamento == 'cartao') {
      if (pagamentoApiResponse['status'] == 'pago') {
        return Icons.check_circle_outline;
      }
      return Icons.credit_card;
    }

    return Icons.calendar_today;
  }

  String confirmacaoTitulo() {
    if (pagamento.tipoPagamento == 'cartao') {
      if (pagamentoApiResponse['status'] == 'pago') {
        return 'Pagamento efetuado com sucesso!';
      }
      return 'Pagamento em Análise';
    }

    return 'Boleto gerado com sucesso';
  }

  String confirmacaoTexto() {
    if (pagamento.tipoPagamento == 'cartao') {
      if (pagamentoApiResponse['status'] == 'pago') {
        return """
ID de confirmação: ${pagamentoApiResponse['pagamento_transacao_juno']}""";
      }
      return 'Enviamos um email assim que o pagamento for aprovado';
    }

    return """
Código Barras boleto: ${pagamentoApiResponse['boleto_codigo_juno']}""";
  }

  Widget confirmacaoBotaoDownloadBoleto() {
    if (pagamento.tipoPagamento == 'cartao') {
      return Container();
    }

    return BotaoBranco(
      texto: 'Baixar Boleto',
      onClick: () async {
        var url = pagamentoApiResponse['boleto_url_juno'];
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Boleto não encontrado';
        }
      },
    );
  }
}
