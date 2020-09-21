import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  String tipoPessoa = 'PF';

  @action
  void defineTipoPessoa(String novotipoPessoa) {
    tipoPessoa = novotipoPessoa;
  }

  String pegaTipoPessoa() {
    if (tipoPessoa != null) {
      return tipoPessoa;
    }

    return "PF";
  }

  bool pj() {
    return tipoPessoa == 'PJ';
  }
}
