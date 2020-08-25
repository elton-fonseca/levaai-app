import 'package:flutter_modular/flutter_modular.dart';

abstract class IPagamentoRepository implements Disposable {
  Future fetchPost();
}
