class ItensPedido {
  String tipoItem;
  int quantidade;
  int altura;
  int largura;
  int comprimento;
  double cubagem;

  ItensPedido(
      {this.tipoItem,
      this.quantidade,
      this.altura,
      this.largura,
      this.comprimento,
      this.cubagem = 0});

  ItensPedido.fromJson(Map<String, dynamic> json) {
    quantidade = json['quantidade'];
    altura = json['altura'];
    largura = json['largura'];
    comprimento = json['comprimento'];
    cubagem = json['cubagem'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tipo_item'] = tipoItem;
    data['quantidade'] = quantidade;

    if (tipoItem == 'cubagem') {
      data['cubagem'] = cubagem * 100;

      return data;
    }

    data['altura'] = altura;
    data['largura'] = largura;
    data['comprimento'] = comprimento;

    return data;
  }
}
