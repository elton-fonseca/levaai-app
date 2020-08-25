import 'package:dio/native_imp.dart';
import 'interfaces/pagamento_repository_interface.dart';

class PagamentoRepository implements IPagamentoRepository {
  final DioForNative client;

  PagamentoRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
