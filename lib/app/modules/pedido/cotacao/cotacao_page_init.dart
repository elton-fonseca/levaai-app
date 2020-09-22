import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/stores/pedido_lista_store.dart';
import 'cotacao_controller.dart';
import 'cotacao_page.dart';
import 'repositories/cotacao_repository.dart';

mixin CotacaoPageInit on ModularState<CotacaoPage, CotacaoController> {
  final responsavelColetaTextController = TextEditingController();
  final responsavelColetaCelularTextController =
      MaskedTextController(mask: '(00) 0000-0000');
  final responsavelEntregaTextController = TextEditingController();
  final responsavelEntregaCelularTextController =
      MaskedTextController(mask: '(00) 0000-0000');
  final observacaoTextController = TextEditingController();

  Future<dynamic> valorCotacao;

  @override
  void initState() {
    controller.indice = widget.id;

    preencheCampos();

    cotar();

    super.initState();
  }

  void preencheCampos() {
    if (widget.acao == 'editar') {
      responsavelColetaTextController.text =
          Modular.get<CotacaoController>().pegaResponsavelColeta();

      responsavelColetaCelularTextController.text =
          Modular.get<CotacaoController>().pegaResponsavelColetaCelular();

      responsavelEntregaTextController.text =
          Modular.get<CotacaoController>().pegaResponsavelEntrega();

      responsavelEntregaCelularTextController.text =
          Modular.get<CotacaoController>().pegaResponsavelEntregaCelular();

      observacaoTextController.text =
          Modular.get<CotacaoController>().pegaObservacao();
    }
  }

  void cotar() {
    var pedido = Modular.get<PedidoListaStore>().pedidos[widget.id];
    
    var json = jsonEncode(pedido.cotacaoJson()).toString();

    valorCotacao = Modular.get<CotacaoRepository>().cotar(json);
  }
}
