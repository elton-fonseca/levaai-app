import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'rastreamento_controller.g.dart';

@Injectable()
class RastreamentoController = _RastreamentoControllerBase
    with _$RastreamentoController;

abstract class _RastreamentoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
