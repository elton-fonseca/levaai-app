import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/Models/pedido.dart';
import '../pages/widgets/formulario/partes/medida_exata.dart';
import '../pages/widgets/formulario/partes/medida_relativa.dart';

part 'pedido_controller.g.dart';

class PedidoController = _PedidoControllerBase with _$PedidoController;

abstract class _PedidoControllerBase with Store {
  @observable
  Widget tipoDeMedida = MedidaRelativa();
  List<Pedido> pedidos = [];

  @action
  void addPedido() {
    var pedidonew = Pedido();
    pedidos.add(pedidonew);
  }

  @action
  void defineEndereco(String novoEndereco, int id) {
    pedidos[id].enderecoOrigem = novoEndereco;
  }

  @action
  void definirMedidaRelativa() {
    tipoDeMedida = MedidaRelativa();
  }

  @action
  void definirMedidaExata() {
    tipoDeMedida = MedidaExata();
  }


}
