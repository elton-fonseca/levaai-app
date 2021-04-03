import 'package:dio/native_imp.dart';
import 'interfaces/cupom_repository_interface.dart';

class CupomRepository implements ICupomRepository {
  final DioForNative client;

  CupomRepository(this.client);

  Future validarCodigo(String codigo) async {
    final response = await client.get(
      '/cupom/$codigo',
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao obter cupom de desconto");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
