// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altera_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlteraController on _AlteraControllerBase, Store {
  final _$usuarioAtom = Atom(name: '_AlteraControllerBase.usuario');

  @override
  dynamic get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(dynamic value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$_AlteraControllerBaseActionController =
      ActionController(name: '_AlteraControllerBase');

  @override
  void defineNome(String value) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineNome');
    try {
      return super.defineNome(value);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineSobrenome(String value) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineSobrenome');
    try {
      return super.defineSobrenome(value);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineDocumento(String value) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineDocumento');
    try {
      return super.defineDocumento(value);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineTelefone(String value) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineTelefone');
    try {
      return super.defineTelefone(value);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineEmail(String value) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineEmail');
    try {
      return super.defineEmail(value);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineTipoPessoa(
      String novotipoPessoa, MaskedTextController controller) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase.defineTipoPessoa');
    try {
      return super.defineTipoPessoa(novotipoPessoa, controller);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _atualizaMascaraDocumento(MaskedTextController controller) {
    final _$actionInfo = _$_AlteraControllerBaseActionController.startAction(
        name: '_AlteraControllerBase._atualizaMascaraDocumento');
    try {
      return super._atualizaMascaraDocumento(controller);
    } finally {
      _$_AlteraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario}
    ''';
  }
}
