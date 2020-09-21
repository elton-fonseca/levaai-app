import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  String tipoPessoa = 'PF';

  @action
  void defineTipoPessoa(
      String novotipoPessoa, MaskedTextController controller) {
    tipoPessoa = novotipoPessoa;
    _atualizaMascaraDocumento(controller);
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

  @action
  void _atualizaMascaraDocumento(MaskedTextController controller) {
    var mascara = pj() ? '00.000.000/0000-00' : '000.000.000-00';

    controller.updateMask(mascara);
  }
}
