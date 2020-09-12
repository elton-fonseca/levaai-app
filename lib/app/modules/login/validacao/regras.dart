import 'package:validators/validators.dart';

String validarEmail(String email) {
  if (email.isEmpty) {
    return 'Preencha o email';
  }

  if (!isEmail(email)) {
    print(isEmail(email));
    return 'Digite um email válido';
  }

  return null;
}

String validarSenha(String senha) {
  if (senha.isEmpty) {
    return 'Senha em branco';
  }

  if (senha.length < 3) {
    return 'A senha deve ter mais 8 caracteres';
  }

  return null;
}
