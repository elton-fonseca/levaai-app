// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoFormController on _PedidoFormControllerBase, Store {
  final _$tipoDeMedidaAtom =
      Atom(name: '_PedidoFormControllerBase.tipoDeMedida');

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

  final _$_PedidoFormControllerBaseActionController =
      ActionController(name: '_PedidoFormControllerBase');

  @override
  void definirMedidaRelativa() {
    final _$actionInfo = _$_PedidoFormControllerBaseActionController
        .startAction(name: '_PedidoFormControllerBase.definirMedidaRelativa');
    try {
      return super.definirMedidaRelativa();
    } finally {
      _$_PedidoFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void definirMedidaExata() {
    final _$actionInfo = _$_PedidoFormControllerBaseActionController
        .startAction(name: '_PedidoFormControllerBase.definirMedidaExata');
    try {
      return super.definirMedidaExata();
    } finally {
      _$_PedidoFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoDeMedida: ${tipoDeMedida}
    ''';
  }
}
