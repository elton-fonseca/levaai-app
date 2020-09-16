import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'cotacao_controller.dart';
import 'cotacao_page.dart';

mixin CotacaoInputs on ModularState<CotacaoPage, CotacaoController> {
  final responsavelColetaTextController = TextEditingController();
  final responsavelColetaCelularTextController = TextEditingController();
  final responsavelEntregaTextController = TextEditingController();
  final responsavelEntregaCElularTextController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;

    if (widget.acao == 'editar') {
      //enderecoOrigemTextController.text =
      //  Modular.get<CotacaoController>().pegaEnderecoOrigem();

    }

    super.initState();
  }
}
