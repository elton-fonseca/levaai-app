import 'package:flutter_modular/flutter_modular.dart';

abstract class IFormularioRepository implements Disposable {
  Future verificaCidadesAtendidas(String data);
}
