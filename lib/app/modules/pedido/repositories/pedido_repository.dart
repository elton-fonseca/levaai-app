import 'package:dio/native_imp.dart';
import 'interfaces/pedido_repository_interface.dart';

class PedidoRepository implements IPedidoRepository {
  final DioForNative client;

  PedidoRepository(this.client);

  Future cadastrar(String dados) async {
    final response = await client.post(
      '/pedido',
      data: dados,
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao pagar");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
