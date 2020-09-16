import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../modules/pedido/formulario/widgets/itens/medida_exata.dart';
import '../Models/pedido.dart';

part 'pedido_lista_store.g.dart';

class PedidoListaStore = _PedidoListaStoreBase with _$PedidoListaStore;

abstract class _PedidoListaStoreBase with Store {


  @observable
  ObservableList pedidos = [].asObservable();

  @observable
  int caixaSapato = 0;

  @action
  void addPedido() {
    var pedidonew = Pedido();
    pedidos.add(pedidonew);
  }

  @action
  void defineEndereco(String novoEndereco, int id) {
    pedidos[id].enderecoOrigem = novoEndereco;
  }


}
