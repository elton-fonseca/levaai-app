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
  String logradouroOrigem;
  String numeroOrigem;
  String cidadeOrigem = "aaaa";
  String bairroOrigem;
  String estadoOrigem = 'SP';

  @observable
  String ibgeOrigem = 'selecione';

  String cepDestino;
  String logradouroDestino;
  String numeroDestino;
  String cidadeDestino = "bbbb";
  String bairroDestino;
  String estadoDestino = 'SP';

  @observable
  String ibgeDestino = 'selecione';

  @observable
  double valorTotal;

  @observable
  bool pesoExato = false;

  @observable
  String pesoTotal;

  @observable
  String tipoMercadoria;

  double valorCotacao = 0;
  int cotacaoId;

  String responsavelColeta;
  String responsavelColetaCelular;
  String responsavelColetaDocumento;
  String responsavelEntrega;
  String responsavelEntregaCelular;
  String responsavelEntregaDocumento;
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
    data['logradouro_origem'] = logradouroOrigem;
    data['numero_origem'] = numeroOrigem;
    data['bairro_origem'] = bairroOrigem;
    data['cidade_origem'] = cidadeOrigem;
    data['ibge_origem'] = ibgeOrigem;

    data['cep_destino'] = cepDestino;
    data['logradouro_destino'] = logradouroDestino;
    data['numero_destino'] = numeroDestino;
    data['bairro_destino'] = bairroDestino;
    data['cidade_destino'] = cidadeDestino;
    data['ibge_destino'] = ibgeDestino;

    data['responsavel_coleta'] = responsavelColeta;
    data['responsavel_coleta_celular'] =
        Validadores.limpaMascara(responsavelColetaCelular);
    data['responsavel_coleta_documento'] =
        Validadores.limpaMascara(responsavelColetaDocumento);
    data['responsavel_entrega'] = responsavelEntrega;
    data['responsavel_entrega_celular'] =
        Validadores.limpaMascara(responsavelEntregaCelular);
    data['responsavel_entrega_documento'] =
        Validadores.limpaMascara(responsavelEntregaDocumento);

    data['observacao'] = observacao;

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
    data['ibge_origem'] = ibgeOrigem;
    data['ibge_destino'] = ibgeDestino;
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
          largura: 20,
          altura: 35,
          comprimento: 12,
        ));
      }

      if (microondas > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'microondas',
          quantidade: microondas,
          largura: 45,
          altura: 26,
          comprimento: 35,
        ));
      }

      if (fogao > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'fogao',
          quantidade: fogao,
          largura: 60,
          altura: 52,
          comprimento: 95,
        ));
      }

      if (geladeira > 0) {
        addItemPedido(ItensPedido(
          tipoItem: 'geladeira',
          quantidade: geladeira,
          largura: 72,
          altura: 190,
          comprimento: 72,
        ));
      }
    }
  }
}
