// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pedido on _PedidoBase, Store {
  final _$valorTotalAtom = Atom(name: '_PedidoBase.valorTotal');

  @override
  String get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(String value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$tipoDeMedidaAtom = Atom(name: '_PedidoBase.tipoDeMedida');

  @override
  Widget get tipoDeMedida {
    _$tipoDeMedidaAtom.reportRead();
    return super.tipoDeMedida;
  }

  @override
  set tipoDeMedida(Widget value) {
    _$tipoDeMedidaAtom.reportWrite(value, super.tipoDeMedida, () {
      super.tipoDeMedida = value;
    });
  }

  final _$caixaSapatoAtom = Atom(name: '_PedidoBase.caixaSapato');

  @override
  int get caixaSapato {
    _$caixaSapatoAtom.reportRead();
    return super.caixaSapato;
  }

  @override
  set caixaSapato(int value) {
    _$caixaSapatoAtom.reportWrite(value, super.caixaSapato, () {
      super.caixaSapato = value;
    });
  }

  final _$microondasAtom = Atom(name: '_PedidoBase.microondas');

  @override
  int get microondas {
    _$microondasAtom.reportRead();
    return super.microondas;
  }

  @override
  set microondas(int value) {
    _$microondasAtom.reportWrite(value, super.microondas, () {
      super.microondas = value;
    });
  }

  final _$fogaoAtom = Atom(name: '_PedidoBase.fogao');

  @override
  int get fogao {
    _$fogaoAtom.reportRead();
    return super.fogao;
  }

  @override
  set fogao(int value) {
    _$fogaoAtom.reportWrite(value, super.fogao, () {
      super.fogao = value;
    });
  }

  final _$geladeiraAtom = Atom(name: '_PedidoBase.geladeira');

  @override
  int get geladeira {
    _$geladeiraAtom.reportRead();
    return super.geladeira;
  }

  @override
  set geladeira(int value) {
    _$geladeiraAtom.reportWrite(value, super.geladeira, () {
      super.geladeira = value;
    });
  }

  final _$itensAtom = Atom(name: '_PedidoBase.itens');

  @override
  ObservableList<dynamic> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<dynamic> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$_PedidoBaseActionController = ActionController(name: '_PedidoBase');

  @override
  void addItemPedido(ItensPedido novoItemPedido) {
    final _$actionInfo = _$_PedidoBaseActionController.startAction(
        name: '_PedidoBase.addItemPedido');
    try {
      return super.addItemPedido(novoItemPedido);
    } finally {
      _$_PedidoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rmItemPedido(int indice) {
    final _$actionInfo = _$_PedidoBaseActionController.startAction(
        name: '_PedidoBase.rmItemPedido');
    try {
      return super.rmItemPedido(indice);
    } finally {
      _$_PedidoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorTotal: ${valorTotal},
tipoDeMedida: ${tipoDeMedida},
caixaSapato: ${caixaSapato},
microondas: ${microondas},
fogao: ${fogao},
geladeira: ${geladeira},
itens: ${itens}
    ''';
  }
}
