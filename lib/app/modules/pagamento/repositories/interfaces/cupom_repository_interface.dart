import 'package:flutter_modular/flutter_modular.dart';

abstract class ICupomRepository implements Disposable {
  Future validarCodigo(String codigo);
}
