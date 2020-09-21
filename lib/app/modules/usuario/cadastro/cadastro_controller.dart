import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  bool pj = false;

  @action
  void alteraTipoPessoa() {
    pj = !pj;
  }
}
