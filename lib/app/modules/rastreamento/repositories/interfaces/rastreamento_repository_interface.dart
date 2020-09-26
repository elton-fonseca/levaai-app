import 'package:flutter_modular/flutter_modular.dart';

abstract class IRastreamentoRepository implements Disposable {
  Future pegarPedidosUsuario();
  Future pegarPedido(int codigoPedido);
}
