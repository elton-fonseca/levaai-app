import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../modules/pedido/formulario/widgets/tipo_medida/medida_relativa.dart';
import '../services/validadores.dart';
import '../stores/identificacao_store.dart';
import 'itens_pedido.dart';

part 'pedido.g.dart';

class Pedido = _PedidoBase with _$Pedido;

abstract class _PedidoBase with Store {
  int idLocal;
  int idPedido;

  String cepOrigem;
  String enderecoOrigem;
  String cidadeOrigem;
  String estadoOrigem;

  String cepDestino;
  String enderecoDestino;
  String cidadeDestino;
  String estadoDestino;

  @observable
  double valorTotal;

  @observable
  String pesoTotal;

  @observable
  String tipoMercadoria;

  double valorCotacao = 0;
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

  Map<String, dynamic> pedidoCompletoJson() {
    final data = <String, dynamic>{};

    data['id_temporario'] = idLocal;
    data['cep_origem'] = cepOrigem;
    data['logradouro_origem'] = enderecoOrigem;
    //data['cidade_origem'] = cidadeOrigem;
    //data['estado_origem'] = estadoOrigem;

    data['cep_destino'] = cepDestino;
    data['logradouro_destino'] = enderecoDestino;
    //data['cidade_destino'] = cidadeDestino;
    //data['estado_destino'] = estadoDestino;

    data['responsavel_coleta'] = responsavelColeta;
    data['responsavel_coleta_celular'] =
        Validadores.limpaMascara(responsavelColetaCelular);
    data['responsavel_entrega'] = responsavelEntrega;
    data['responsavel_entrega_celular'] =
        Validadores.limpaMascara(responsavelEntregaCelular);

    data['valor_total'] = valorTotal;
    data['peso_total'] = double.parse(pesoTotal);
    data['tipo_itens'] = tipoMercadoria;

    data['cotacao_id'] = cotacaoId;

    _adicionaItensRelativos();

    data['tipo_medida'] = tipoDeMedida is MedidaRelativa ? 'relativa' : 'exata';

    data['itens'] = itens.map((v) => v.toJson()).toList();

    return data;
  }

  Map<String, dynamic> cotacaoJson() {
    final data = <String, dynamic>{};
    data['cep_origem'] = cepOrigem;
    data['cep_destino'] = cepDestino;
    data['valor_total'] = valorTotal;
    data['peso_total'] = double.parse(pesoTotal);

    data['identificacao_device'] =
        Modular.get<IdentificacaoStore>().idDispositivo;

    _adicionaItensRelativos();

    data['tipo_medida'] = tipoDeMedida is MedidaRelativa ? 'relativa' : 'exata';

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
          tipoItem: 'caixaSapato',
          quantidade: caixaSapato,
          largura: 25,
          altura: 15,
          comprimento: 50,
        ));
      }

      if (microondas > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'microondas',
          quantidade: microondas,
          largura: 50,
          altura: 50,
          comprimento: 50,
        ));
      }

      if (fogao > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'fogao',
          quantidade: fogao,
          largura: 50,
          altura: 90,
          comprimento: 90,
        ));
      }

      if (geladeira > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'geladeira',
          quantidade: geladeira,
          largura: 160,
          altura: 60,
          comprimento: 80,
        ));
      }
    }
  }
}
