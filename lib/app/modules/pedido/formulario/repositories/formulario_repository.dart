import 'package:dio/native_imp.dart';
import 'interfaces/formulario_repository_interface.dart';

class FormularioRepository implements IFormularioRepository {
  final DioForNative client;

  FormularioRepository(this.client);

  Future verificaCidadesAtendidas(String dados) async {
    final response = await client.post(
      '/verificar-cidades-atendidas',
      data: dados,
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao validar cidades");
  }

  Future obtemCidadesAtendidas() async {
    final response = await client.get(
      '/obter-cidades-atendidas'
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao obter cidades");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
