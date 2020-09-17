import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../modules/pedido/formulario/widgets/tipo_medida/medida_relativa.dart';
import 'itens_pedido.dart';

part 'pedido.g.dart';

class Pedido = _PedidoBase with _$Pedido;

abstract class _PedidoBase with Store {
  String cepOrigem;
  String enderecoOrigem;

  String cepDestino;
  String enderecoDestino;

  @observable
  String valorTotal;

  int pesoTotal;
  String tipoMercadoria;
  int cotacaoId;

  String responsavelColeta;
  String responsavelColetaCelular;
  String responsavelEntrega;
  String responsavelEntregaCelular;
  String observacao;

  @observable
  Widget tipoDeMedida = MedidaRelativa();

  @observable
  int caixaSapato = 0;

  @observable
  int microondas = 0;

  @observable
  int fogao = 0;

  @observable
  int geladeira = 0;

  @observable
  ObservableList itens = [
    ItensPedido(quantidade: 1, altura: 50, largura: 50, comprimento: 50),
    ItensPedido(quantidade: 2, altura: 150, largura: 150, comprimento: 150),
    ItensPedido(quantidade: 3, altura: 250, largura: 250, comprimento: 250),
  ].asObservable();

  @action
  void addItemPedido(ItensPedido novoItemPedido) {
    itens.add(novoItemPedido);
  }

  @action
  void rmItemPedido(int indice) {
    itens.removeAt(indice);
  }
}
