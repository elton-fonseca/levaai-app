import 'itens_pedido.dart';

class Pedido {
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
  List<ItensPedido> itens;

  Pedido(
      {this.cepOrigem,
      this.enderecoOrigem,
      this.cepDestino,
      this.enderecoDestino,
      this.valorTotal,
      this.pesoTotal,
      this.tipoMercadoria,
      this.cotacaoId,
      this.responsavelColeta,
      this.responsavelColetaCelular,
      this.responsavelEntrega,
      this.responsavelEntregaCalular,
      this.tipoPesagem,
      this.itens});

  Pedido.fromJson(Map<String, dynamic> json) {
    cepOrigem = json['cep_origem'];
    enderecoOrigem = json['endereco_origem'];
    cepDestino = json['cep_destino'];
    enderecoDestino = json['endereco_destino'];
    valorTotal = json['valor_total'];
    pesoTotal = json['peso_total'];
    tipoMercadoria = json['tipo_mercadoria'];
    cotacaoId = json['cotacao_id'];
    responsavelColeta = json['responsavel_coleta'];
    responsavelColetaCelular = json['responsavel_coleta_celular'];
    responsavelEntrega = json['responsavel_entrega'];
    responsavelEntregaCalular = json['responsavel_entrega_calular'];
    tipoPesagem = json['tipo_pesagem'];
    if (json['itens'] != null) {
      itens = <ItensPedido>[];
      json['itens'].forEach((v) {
        itens.add(ItensPedido.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cep_origem'] = cepOrigem;
    data['endereco_origem'] = enderecoOrigem;
    data['cep_destino'] = cepDestino;
    data['endereco_destino'] = enderecoDestino;
    data['valor_total'] = valorTotal;
    data['peso_total'] = pesoTotal;
    data['tipo_mercadoria'] = tipoMercadoria;
    data['cotacao_id'] = cotacaoId;
    data['responsavel_coleta'] = responsavelColeta;
    data['responsavel_coleta_celular'] = responsavelColetaCelular;
    data['responsavel_entrega'] = responsavelEntrega;
    data['responsavel_entrega_calular'] = responsavelEntregaCalular;
    data['tipo_pesagem'] = tipoPesagem;
    if (ItensPedido != null) {
      data['ItensPedido'] = itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
