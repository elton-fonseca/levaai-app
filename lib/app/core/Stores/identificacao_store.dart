import 'package:mobx/mobx.dart';

part 'identificacao_store.g.dart';

class IdentificacaoStore = _IdentificacaoStoreBase with _$IdentificacaoStore;

abstract class _IdentificacaoStoreBase with Store {
  @observable
  String idDispositivo;
}
