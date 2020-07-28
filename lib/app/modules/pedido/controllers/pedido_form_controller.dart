import 'package:mobx/mobx.dart';

import 'package:flutter/material.dart';
import '../pages/widgets/medida_exata.dart';
import '../pages/widgets/medida_relativa.dart';

part 'pedido_form_controller.g.dart';

class PedidoFormController = _PedidoFormControllerBase
    with _$PedidoFormController;

abstract class _PedidoFormControllerBase with Store {
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
