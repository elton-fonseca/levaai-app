import 'package:dio/native_imp.dart';
import 'interfaces/pagamento_repository_interface.dart';

class PagamentoRepository implements IPagamentoRepository {
  final DioForNative client;

  PagamentoRepository(this.client);

  Future cadastrar(String dados) async {
    final response = await client.post(
      '/pagamento',
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
