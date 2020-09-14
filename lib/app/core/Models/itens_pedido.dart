class ItensPedido {
  String descricao;
  int quantidade;
  int altura;
  int largura;
  int comprimento;
  int cubagem;

  ItensPedido(
      {this.descricao,
      this.quantidade,
      this.altura,
      this.largura,
      this.comprimento,
      this.cubagem});

  ItensPedido.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    quantidade = json['quantidade'];
    altura = json['altura'];
    largura = json['largura'];
    comprimento = json['comprimento'];
    cubagem = json['cubagem'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['quantidade'] = quantidade;
    data['altura'] = altura;
    data['largura'] = largura;
    data['comprimento'] = comprimento;
    data['cubagem'] = cubagem;
    return data;
  }
}
