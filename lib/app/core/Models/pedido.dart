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
  double valorTotal;

  @observable
  String pesoTotal;

  @observable
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
    data['valor_total'] = valorTotal;
    data['peso_total'] = double.parse(pesoTotal);

    data['identificacao_device'] = 'aaa';

    _adicionaItensRelativos();

    data['itens'] = itens.map((v) => v.toJson()).toList();

    return data;
  }

  Map<String, dynamic> cidadesJson() {
    final data = <String, dynamic>{};
    data['cep_origem'] = cepOrigem;
    data['cep_destino'] = cepDestino;

    return data;
  }

  void _adicionaItensRelativos() {
    if (tipoDeMedida is MedidaRelativa) {
      itens = [].asObservable();

      if (caixaSapato > 0) {
        addItemPedido(ItensPedido(
          quantidade: caixaSapato,
          largura: 25,
          altura: 15,
          comprimento: 50,
        ));
      }

      if (microondas > 0) {
        addItemPedido(ItensPedido(
          quantidade: microondas,
          largura: 50,
          altura: 50,
          comprimento: 50,
        ));
      }

      if (fogao > 0) {
        addItemPedido(ItensPedido(
          quantidade: fogao,
          largura: 50,
          altura: 90,
          comprimento: 90,
        ));
      }

      if (geladeira > 0) {
        addItemPedido(ItensPedido(
          quantidade: geladeira,
          largura: 160,
          altura: 60,
          comprimento: 80,
        ));
      }
    }
  }
}
