import 'package:flutter_modular/flutter_modular.dart';

abstract class ILoginRepository implements Disposable {
  Future login(String $email, String senha);
}
