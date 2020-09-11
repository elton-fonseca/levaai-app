import 'package:validators/validators.dart';

String validar_email(String email) {
  if (email.isEmpty) {
    return 'Preencha o email';
  }

  if (isEmail(email)) {
    return 'Digite um email válido';
  }

  if (email.length < 3) {
    return 'A senha deve ter mais 8 caracteres';
  }

  return null;
}

String validar_senha(String senha) {
  if (senha.isEmpty) {
    return 'Senha em branco';
  }

  if (senha.length < 3) {
    return 'A senha deve ter mais 8 caracteres';
  }

  return null;
}
