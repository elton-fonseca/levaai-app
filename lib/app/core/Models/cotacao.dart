class Cotacao {
  double valor;

  int cotacaoId;

  int prazoColeta;
  int prazoEntrega;

  Cotacao({this.valor, this.cotacaoId});

  Cotacao.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
    cotacaoId = json['cotacao_id'];
    prazoColeta = json['prazo_coleta'];
    prazoEntrega = json['prazo_entrega'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['valor'] = valor;
    data['cotacao_id'] = cotacaoId;
    return data;
  }
}
