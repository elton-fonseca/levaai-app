import 'package:flutter_modular/flutter_modular.dart';

abstract class IMonitoramentoRepository implements Disposable {
  Future registrarAcao(String acao);
}
