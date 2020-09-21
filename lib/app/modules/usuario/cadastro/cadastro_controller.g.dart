// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$tipoPessoaAtom = Atom(name: '_CadastroControllerBase.tipoPessoa');

  @override
  String get tipoPessoa {
    _$tipoPessoaAtom.reportRead();
    return super.tipoPessoa;
  }

  @override
  set tipoPessoa(String value) {
    _$tipoPessoaAtom.reportWrite(value, super.tipoPessoa, () {
      super.tipoPessoa = value;
    });
  }

  final _$_CadastroControllerBaseActionController =
      ActionController(name: '_CadastroControllerBase');

  @override
  void defineTipoPessoa(String novotipoPessoa) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.defineTipoPessoa');
    try {
      return super.defineTipoPessoa(novotipoPessoa);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoPessoa: ${tipoPessoa}
    ''';
  }
}
