import 'package:mobx/mobx.dart';

part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {
  @observable
  String tipoPessoa = 'PF';

  String nomeFantasia;
  String sobrenomeRazao;

  String telefone;
  String documento;

  String email;
  String senha;
  String confirmacaoSenha;
}
