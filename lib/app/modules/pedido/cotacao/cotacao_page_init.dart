import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/monitoramento_repository.dart';
import '../../../core/stores/pedido_lista_store.dart';
import 'cotacao_controller.dart';
import 'cotacao_page.dart';
import 'repositories/cotacao_repository.dart';

mixin CotacaoPageInit on ModularState<CotacaoPage, CotacaoController> {
  final responsavelColetaTextController = TextEditingController();
  final responsavelColetaCelularTextController =
      MaskedTextController(mask: '(00) 00000-0000');
  final responsavelColetaDocumentoController =
      MaskedTextController(mask: '000.000.000-000');
  final responsavelEntregaTextController = TextEditingController();
  final responsavelEntregaCelularTextController =
      MaskedTextController(mask: '(00) 00000-0000');
  final responsavelEntregaDocumentoController =
      MaskedTextController(mask: '000.000.000-000');
  final observacaoTextController = TextEditingController();

  Future<dynamic> valorCotacao;

  @override
  void initState() {
    controller.indice = widget.id;
    controller.acao = widget.acao;

    preencheCampos();

    cotar();

    super.initState();
  }

  void preencheCampos() {
    responsavelColetaTextController.text = controller.pegaResponsavelColeta();

    responsavelColetaCelularTextController.text =
        controller.pegaResponsavelColetaCelular();

    responsavelColetaDocumentoController.text = controller
        .pegaResponsavelColetaDocumento(responsavelColetaDocumentoController);

    responsavelEntregaTextController.text = controller.pegaResponsavelEntrega();

    responsavelEntregaCelularTextController.text =
        controller.pegaResponsavelEntregaCelular();

    responsavelEntregaDocumentoController.text = controller
        .pegaResponsavelEntregaDocumento(responsavelEntregaDocumentoController);

    observacaoTextController.text = controller.pegaObservacao();

    Modular.get<MonitoramentoRepository>()
        .registrarAcao('cotacao/${widget.acao}/${widget.id}');
  }

  void cotar() {
    var pedido = Modular.get<PedidoListaStore>().pedidos[widget.id];

    var json = jsonEncode(pedido.cotacaoJson());

    valorCotacao = Modular.get<CotacaoRepository>().cotar(json);

    valorCotacao.then((value) {
      controller.cotacaoValor = value.valor;
      controller.cotacaoId = value.cotacaoId;
    });
  }
}
