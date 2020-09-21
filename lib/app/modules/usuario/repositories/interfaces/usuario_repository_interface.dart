import 'package:flutter_modular/flutter_modular.dart';

abstract class IUsuarioRepository implements Disposable {
  Future login(String $email, String senha);
}
