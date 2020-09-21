import 'package:mobx/mobx.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  @observable
  String tipoPagamento = 'cartao';

  @action
  void defineTipoPagamento(String novoTipoPagamento) {
    tipoPagamento = novoTipoPagamento;
  }

  String pegaTipoPagamento() {
    if (tipoPagamento != null) {
      return tipoPagamento;
    }

    return "cartao";
  }
}
