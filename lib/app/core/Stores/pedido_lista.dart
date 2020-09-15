import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../modules/pedido/pages/widgets/formulario/partes/medida_exata.dart';
import '../../modules/pedido/pages/widgets/formulario/partes/medida_relativa.dart';
import '../Models/pedido.dart';

part 'pedido_lista.g.dart';

class PedidoLista = _PedidoListaBase with _$PedidoLista;

abstract class _PedidoListaBase with Store {
  @observable
  Widget tipoDeMedida = MedidaRelativa();
  ObservableList pedidos = [].asObservable();

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
