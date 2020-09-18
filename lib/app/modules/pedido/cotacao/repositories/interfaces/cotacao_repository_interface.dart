import 'package:flutter_modular/flutter_modular.dart';

abstract class ICotacaoRepository implements Disposable {
  Future cotar(String data);
}
