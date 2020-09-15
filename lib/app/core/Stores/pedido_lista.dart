import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../modules/pedido/formulario/widgets/itens/medida_exata.dart';
import '../../modules/pedido/formulario/widgets/itens/medida_relativa.dart';
import '../Models/pedido.dart';

part 'pedido_lista.g.dart';

class PedidoLista = _PedidoListaBase with _$PedidoLista;

abstract class _PedidoListaBase with Store {
  @observable
  Widget tipoDeMedida;
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
  void addSapato(int id) {
    pedidos[id].caixaSapato++;
  }

  @action
  void definirMedidaRelativa() {
    //tipoDeMedida = MedidaRelativa();
  }

  @action
  void definirMedidaExata() {
    tipoDeMedida = MedidaExata();
  }
}
