class Cotacao {
  double valor;

  Cotacao({this.valor});

  Cotacao.fromJson(Map<String, dynamic> json) {
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['valor'] = valor;
    return data;
  }
}