import 'package:mobx/mobx.dart';

part 'pagamento.g.dart';

class Pagamento = _PagamentoBase with _$Pagamento;

abstract class _PagamentoBase with Store {
  @observable
  String tipoPagamento = 'cartao';

  String nome;
  String numeroCartao;

  String validade;
  String codigoSeguranca;
}
