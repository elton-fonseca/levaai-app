// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoController on _PedidoControllerBase, Store {
  final _$tipoDeMedidaAtom = Atom(name: '_PedidoControllerBase.tipoDeMedida');

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

  final _$_PedidoControllerBaseActionController =
      ActionController(name: '_PedidoControllerBase');

  @override
  void definirMedidaRelativa() {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.definirMedidaRelativa');
    try {
      return super.definirMedidaRelativa();
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void definirMedidaExata() {
    final _$actionInfo = _$_PedidoControllerBaseActionController.startAction(
        name: '_PedidoControllerBase.definirMedidaExata');
    try {
      return super.definirMedidaExata();
    } finally {
      _$_PedidoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoDeMedida: ${tipoDeMedida}
    ''';
  }
}
