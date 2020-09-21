import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/usuario.dart';
import '../../../core/view/helpers.dart';
import 'validacao/valida_formulario.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  @observable
  Usuario usuario = Usuario();

  void enviar(BuildContext context) {
    var valido = ValidaFormulario().validar();

    if (valido.isEmpty) {
      Modular.to.pushNamed('/pagamento');
      return;
    }

    Helpers.snackLevaai(texto: valido, context: context);
  }

  @action
  void defineTipoPessoa(
    String novotipoPessoa,
    MaskedTextController controller,
  ) {
    usuario.tipoPessoa = novotipoPessoa;
    _atualizaMascaraDocumento(controller);
  }

  String pegaTipoPessoa() {
    if (usuario.tipoPessoa != null) {
      return usuario.tipoPessoa;
    }

    return "PF";
  }

  bool pj() {
    return usuario.tipoPessoa == 'PJ';
  }

  @action
  void _atualizaMascaraDocumento(MaskedTextController controller) {
    var mascara = pj() ? '00.000.000/0000-00' : '000.000.000-00';

    controller.updateMask(mascara);
  }
}
