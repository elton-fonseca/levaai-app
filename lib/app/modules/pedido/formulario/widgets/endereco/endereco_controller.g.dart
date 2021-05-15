// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoController on _EnderecoControllerBase, Store {
  final _$readOnlyAtom = Atom(name: '_EnderecoControllerBase.readOnly');

  @override
  bool get readOnly {
    _$readOnlyAtom.reportRead();
    return super.readOnly;
  }

  @override
  set readOnly(bool value) {
    _$readOnlyAtom.reportWrite(value, super.readOnly, () {
      super.readOnly = value;
    });
  }

  final _$_EnderecoControllerBaseActionController =
      ActionController(name: '_EnderecoControllerBase');

  @override
  void liberaReadOnly() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.liberaReadOnly');
    try {
      return super.liberaReadOnly();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void autocompleteEndereco(
      {BuildContext context,
      String cep,
      @required TextEditingController logradouroTextController,
      @required TextEditingController numeroTextController,
      @required TextEditingController bairroTextController,
      @required String tipo,
      @required Function atualizaCidadeDropdown}) {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.autocompleteEndereco');
    try {
      return super.autocompleteEndereco(
          context: context,
          cep: cep,
          logradouroTextController: logradouroTextController,
          numeroTextController: numeroTextController,
          bairroTextController: bairroTextController,
          tipo: tipo,
          atualizaCidadeDropdown: atualizaCidadeDropdown);
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
readOnly: ${readOnly}
    ''';
  }
}
