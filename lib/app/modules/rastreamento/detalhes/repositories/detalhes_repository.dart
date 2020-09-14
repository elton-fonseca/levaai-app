import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/detalhes_repository_interface.dart';

@Injectable()
class DetalhesRepository implements IDetalhesRepository {
  final DioForNative client;

  DetalhesRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
