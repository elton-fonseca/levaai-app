import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/rastreamento_repository_interface.dart';

@Injectable()
class RastreamentoRepository implements IRastreamentoRepository {
  final DioForNative client;

  RastreamentoRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
