import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'cotacao_controller.dart';
import 'cotacao_page.dart';

mixin CotacaoInputs on ModularState<CotacaoPage, CotacaoController> {
  final responsavelColetaTextController = TextEditingController();
  final responsavelColetaCelularTextController = TextEditingController();
  final responsavelEntregaTextController = TextEditingController();
  final responsavelEntregaCelularTextController = TextEditingController();
  final observacaoTextController = TextEditingController();

  @override
  void initState() {
    controller.indice = widget.id;

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

    super.initState();
  }
}
