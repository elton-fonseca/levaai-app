// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagamentoController on _PagamentoControllerBase, Store {
  final _$pagamentoAtom = Atom(name: '_PagamentoControllerBase.pagamento');

  @override
  dynamic get pagamento {
    _$pagamentoAtom.reportRead();
    return super.pagamento;
  }

  @override
  set pagamento(dynamic value) {
    _$pagamentoAtom.reportWrite(value, super.pagamento, () {
      super.pagamento = value;
    });
  }

  final _$botaoPagarAtom = Atom(name: '_PagamentoControllerBase.botaoPagar');

  @override
  bool get botaoPagar {
    _$botaoPagarAtom.reportRead();
    return super.botaoPagar;
  }

  @override
  set botaoPagar(bool value) {
    _$botaoPagarAtom.reportWrite(value, super.botaoPagar, () {
      super.botaoPagar = value;
    });
  }

  final _$_PagamentoControllerBaseActionController =
      ActionController(name: '_PagamentoControllerBase');

  @override
  void pagar(BuildContext context) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.pagar');
    try {
      return super.pagar(context);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineTipoPagamento(String novoTipoPagamento) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.defineTipoPagamento');
    try {
      return super.defineTipoPagamento(novoTipoPagamento);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void autocompleteEndereco(
      {BuildContext context,
      String cep,
      @required TextEditingController logradouroTextController,
      @required TextEditingController bairroTextController,
      @required TextEditingController cidadeTextController,
      @required TextEditingController estadoTextController}) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.autocompleteEndereco');
    try {
      return super.autocompleteEndereco(
          context: context,
          cep: cep,
          logradouroTextController: logradouroTextController,
          bairroTextController: bairroTextController,
          cidadeTextController: cidadeTextController,
          estadoTextController: estadoTextController);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineStatusBotaoPagar({bool status}) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.defineStatusBotaoPagar');
    try {
      return super.defineStatusBotaoPagar(status: status);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pagamento: ${pagamento},
botaoPagar: ${botaoPagar}
    ''';
  }
}
