import 'dart:ffi';

import 'package:mobx/mobx.dart';

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
  String responsavelEntregaCalular;
  String tipoPesagem;

  @observable
  int caixaSapato = 0;

  @observable
  int microondas = 0;

  @observable
  int fogao = 0;

  @observable
  int geladeira = 0;

  List<ItensPedido> itens;
}
