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
  ObservableList itens = [].asObservable();

  @action
  void addItemPedido(ItensPedido novoItemPedido) {
    itens.add(novoItemPedido);
  }

  @action
  void rmItemPedido(int indice) {
    itens.removeAt(indice);
  }

  Map<String, dynamic> cotacaoJson() {
    final data = <String, dynamic>{};
    data['cep_origem'] = cepOrigem;
    data['cep_destino'] = cepDestino;
    data['valor_total'] = 500.00;
    data['peso_total'] = pesoTotal;
    if (itens != null) {
      data['itens'] = itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
