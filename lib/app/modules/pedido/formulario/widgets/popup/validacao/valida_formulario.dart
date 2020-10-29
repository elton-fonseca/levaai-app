import '../popup_controller.dart';
import '../widgets/dimensoes.dart';

class ValidaFormulario {
  ValidaFormulario(this.item);

  PopupController item;

  String validar() {
    var resultado = _quantidade();

    if (item.tipoForm is Dimensoes) {
      resultado += _altura();
      resultado += _largura();
      resultado += _comprimento();
    } else {
      resultado += _cubagem();
    }

    return resultado;
  }

  String _quantidade() {
    if (item.quantidade == null || item.quantidade <= 0) {
      return 'Preencha quantidade\n';
    }

    return '';
  }

  String _altura() {
    if (item.altura == null || item.altura <= 0) {
      return 'Preencha altura\n';
    }

    if (item.altura > 200) {
      return 'Altura maior que a permitida\n';
    }

    return '';
  }

  String _largura() {
    if (item.largura == null || item.largura <= 0) {
      return 'Preencha largura\n';
    }

    if (item.largura > 120) {
      return 'Largura maior que a permitida\n';
    }

    return '';
  }

  String _comprimento() {
    if (item.comprimento == null || item.comprimento <= 0) {
      return 'Preencha comprimento\n';
    }

    if (item.largura > 120) {
      return 'Comprimento maior que o permitido\n';
    }

    return '';
  }

  String _cubagem() {
    if (item.cubagem == null || item.cubagem <= 0) {
      return 'Preencha cubagem\n';
    }

    if (item.cubagem > 2.88) {
      return 'Tamanho do item maior que o permitido\n';
    }

    return '';
  }
}
