import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/monitoramento_repository.dart';
import '../../../core/stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';
import 'repositories/formulario_repository.dart';
import 'widgets/detalhes/detalhes_controller.dart';
import 'widgets/endereco/endereco_controller.dart';
import 'widgets/popup/popup_controller.dart';
import 'widgets/tipo_medida/tipo_medida_controller.dart';

mixin FormularioInputs on ModularState<FormularioPage, FormularioController> {
  final cepOrigemTextController = TextEditingController();
  final logradouroOrigemTextController = TextEditingController();
  final numeroOrigemTextController = TextEditingController();
  final bairroOrigemComplementoTextController = TextEditingController();

  final cepDestinoTextController = TextEditingController();
  final logradouroDestinoTextController = TextEditingController();
  final numeroDestinoTextController = TextEditingController();
  final bairroDestinoComplementoTextController = TextEditingController();

  final valorTotalTextController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  final pesoTextController = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '', precision: 0);
  final tipoMercadoriaTextController = TextEditingController();

  Future<dynamic> cidadesAtendidas;

  @override
  void initState() {
    controller.indice = widget.id;
    Modular.get<TipoMedidaController>().indice = widget.id;
    Modular.get<PopupController>().indice = widget.id;
    Modular.get<EnderecoController>().indice = widget.id;
    Modular.get<DetalhesController>().indice = widget.id;

    cidadesAtendidas =
        Modular.get<FormularioRepository>().obtemCidadesAtendidas();

    //garante que a lista vai estar limpa no começo
    if (widget.acao == 'criar' && widget.id == 0) {
      Modular.get<PedidoListaStore>().limpar();
      Modular.get<PedidoListaStore>().valorTotalPedidos = 0;

      controller.avisoLocaisAtendidos(context);
    }

    if (widget.acao == 'criar') {
      Modular.get<PedidoListaStore>().addPedido();
      Modular.get<PedidoListaStore>().pedidos[widget.id].idLocal = widget.id;
    } else {
      Modular.get<EnderecoController>().preencheCamposEndereco(
        cepOrigemTextController: cepOrigemTextController,
        logradouroOrigemTextController: logradouroOrigemTextController,
        numeroOrigemTextController: numeroOrigemTextController,
        bairroOrigemTextController: bairroOrigemComplementoTextController,
        cepDestinoTextController: cepDestinoTextController,
        logradouroDestinoTextController: logradouroDestinoTextController,
        numeroDestinoTextController: numeroDestinoTextController,
        bairroDestinoTextController: bairroDestinoComplementoTextController,
      );

      valorTotalTextController
          .updateValue(Modular.get<DetalhesController>().pegaValorTotal());

      pesoTextController.text =
          Modular.get<DetalhesController>().pegaPesoTotal();

      tipoMercadoriaTextController.text =
          Modular.get<DetalhesController>().pegaTipoMercadoria();
    }

    controller.defineValorTotal(valorTotalTextController);
    controller.definePesoTotal(pesoTextController);

    Modular.get<MonitoramentoRepository>()
        .registrarAcao('formulario/${widget.acao}/${widget.id}');

    super.initState();
  }
}
