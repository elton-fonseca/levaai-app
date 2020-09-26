import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/rastreamento_repository_interface.dart';

@Injectable()
class RastreamentoRepository implements IRastreamentoRepository {
  final DioForNative client;

  RastreamentoRepository(this.client);

  Future pegarPedidosUsuario() async {
    final response = await client.get('/pedido');

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro busca pedidos");
  }

  Future pegarPedido(int codigoPedido) async {
    final response = await client.get('/pedido/$codigoPedido');

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro busca pedidos");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
