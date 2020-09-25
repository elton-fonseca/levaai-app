import 'package:flutter_modular/flutter_modular.dart';

abstract class IPedidoRepository implements Disposable {
  Future cadastrar(String dados);
}
