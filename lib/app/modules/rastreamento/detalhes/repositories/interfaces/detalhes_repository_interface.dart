import 'package:flutter_modular/flutter_modular.dart';

abstract class IDetalhesRepository implements Disposable {
  Future fetchPost();
}
