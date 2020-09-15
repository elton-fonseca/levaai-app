import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'lista_controller.g.dart';

@Injectable()
class ListaController = _ListaControllerBase with _$ListaController;

abstract class _ListaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
