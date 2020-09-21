import 'package:mobx/mobx.dart';

part 'usuario.g.dart';

class Usuario = _PedidoBase with _$Usuario;

abstract class _PedidoBase with Store {
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
