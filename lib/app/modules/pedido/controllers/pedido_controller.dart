import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../pages/widgets/formulario/partes/medida_exata.dart';
import '../pages/widgets/formulario/partes/medida_relativa.dart';

part 'pedido_controller.g.dart';

class PedidoController = _PedidoControllerBase with _$PedidoController;

abstract class _PedidoControllerBase with Store {
  @observable
  Widget tipoDeMedida = MedidaRelativa();

  @action
  void definirMedidaRelativa() {
    tipoDeMedida = MedidaRelativa();
  }

  @action
  void definirMedidaExata() {
    tipoDeMedida = MedidaExata();
  }
}
