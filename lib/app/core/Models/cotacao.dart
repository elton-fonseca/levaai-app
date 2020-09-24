class Cotacao {
  double valor;

  int cotacaoId;

  Cotacao({this.valor, this.cotacaoId});

  Cotacao.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
    cotacaoId = json['cotacao_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['valor'] = valor;
    data['cotacao_id'] = cotacaoId;
    return data;
  }
}
