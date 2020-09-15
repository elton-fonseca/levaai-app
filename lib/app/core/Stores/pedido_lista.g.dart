// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_lista.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoLista on _PedidoListaBase, Store {
  final _$tipoDeMedidaAtom = Atom(name: '_PedidoListaBase.tipoDeMedida');

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

  final _$_PedidoListaBaseActionController =
      ActionController(name: '_PedidoListaBase');

  @override
  void addPedido() {
    final _$actionInfo = _$_PedidoListaBaseActionController.startAction(
        name: '_PedidoListaBase.addPedido');
    try {
      return super.addPedido();
    } finally {
      _$_PedidoListaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineEndereco(String novoEndereco, int id) {
    final _$actionInfo = _$_PedidoListaBaseActionController.startAction(
        name: '_PedidoListaBase.defineEndereco');
    try {
      return super.defineEndereco(novoEndereco, id);
    } finally {
      _$_PedidoListaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void definirMedidaRelativa() {
    final _$actionInfo = _$_PedidoListaBaseActionController.startAction(
        name: '_PedidoListaBase.definirMedidaRelativa');
    try {
      return super.definirMedidaRelativa();
    } finally {
      _$_PedidoListaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void definirMedidaExata() {
    final _$actionInfo = _$_PedidoListaBaseActionController.startAction(
        name: '_PedidoListaBase.definirMedidaExata');
    try {
      return super.definirMedidaExata();
    } finally {
      _$_PedidoListaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoDeMedida: ${tipoDeMedida}
    ''';
  }
}
