class ItensPedido {
  int quantidade;
  int altura;
  int largura;
  int comprimento;
  int cubagem;

  ItensPedido(
      {this.quantidade,
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

  Map<String, dynamic> toJson(String tipoDeMedida) {
    final data = <String, dynamic>{};
    data['quantidade'] = quantidade;
    data['altura'] = altura;
    data['largura'] = largura;
    data['comprimento'] = comprimento;
    data['tipo_medida'] = tipoDeMedida;
    return data;
  }
}
