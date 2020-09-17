// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PopupController on _PopupControllerBase, Store {
  final _$tipoFormAtom = Atom(name: '_PopupControllerBase.tipoForm');

  @override
  Widget get tipoForm {
    _$tipoFormAtom.reportRead();
    return super.tipoForm;
  }

  @override
  set tipoForm(Widget value) {
    _$tipoFormAtom.reportWrite(value, super.tipoForm, () {
      super.tipoForm = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_PopupControllerBase.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$_PopupControllerBaseActionController =
      ActionController(name: '_PopupControllerBase');

  @override
  void definirFormDimensoes() {
    final _$actionInfo = _$_PopupControllerBaseActionController.startAction(
        name: '_PopupControllerBase.definirFormDimensoes');
    try {
      return super.definirFormDimensoes();
    } finally {
      _$_PopupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void definirFormCubagem() {
    final _$actionInfo = _$_PopupControllerBaseActionController.startAction(
        name: '_PopupControllerBase.definirFormCubagem');
    try {
      return super.definirFormCubagem();
    } finally {
      _$_PopupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuantidade() {
    final _$actionInfo = _$_PopupControllerBaseActionController.startAction(
        name: '_PopupControllerBase.addQuantidade');
    try {
      return super.addQuantidade();
    } finally {
      _$_PopupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rmQuantidade() {
    final _$actionInfo = _$_PopupControllerBaseActionController.startAction(
        name: '_PopupControllerBase.rmQuantidade');
    try {
      return super.rmQuantidade();
    } finally {
      _$_PopupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoForm: ${tipoForm},
quantidade: ${quantidade}
    ''';
  }
}
