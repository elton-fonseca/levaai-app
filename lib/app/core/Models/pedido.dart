import 'package:mobx/mobx.dart';

import 'itens_pedido.dart';

part 'pedido.g.dart';

class Pedido = _PedidoBase with _$Pedido;

abstract class _PedidoBase with Store {
  String cepOrigem;

  String enderecoOrigem;

  String cepDestino;
  String enderecoDestino;
  int valorTotal;
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
  int microondas = 0;
  int fogao = 0;
  int geladeira = 0;

  List<ItensPedido> itens;
}
