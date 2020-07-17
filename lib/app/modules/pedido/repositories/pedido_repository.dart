import 'package:dio/native_imp.dart';
import 'interfaces/pedido_repository_interface.dart';

class PedidoRepository implements IPedidoRepository {
  final DioForNative client;

  PedidoRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
