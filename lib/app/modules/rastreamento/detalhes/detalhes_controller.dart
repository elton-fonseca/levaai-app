import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  // ignore: missing_return
  String descritivoItem(Map item) {
    switch (item['tipo_item']) {
      case 'cubagem':
        return 'Cubagem ${item['cubagem']}';
        break;
      case 'caixaSapato':
        return 'Tamanho Aproximado Caixa de Sapato';
        break;
      case 'microondas':
        return 'Tamanho Aproximado Caixa de Sapato';
        break;
      case 'fogao':
        return 'Tamanho Aproximado Fogão';
        break;
      case 'geladeira':
        return 'Tamanho Aproximado Geladeira';
        break;
      case 'dimensoes':
        var d = "${item['largura']}x${item['altura']}x${item['comprimento']}";
        return 'Dimensões $d';
        break;
    }
  }
}
