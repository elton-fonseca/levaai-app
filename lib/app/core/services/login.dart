import 'package:dio/native_imp.dart';

import 'local_storage.dart';

class Login {
  void adicionaLoginToken(DioForNative dioClient) {
    LocalStorage.getValue<String>("token").then((token) {
      if (token.toString().isNotEmpty) {
        dioClient.options.headers["Authorization"] =
            'Bearer ${token.toString()}';
      } else {
        dioClient.options.headers.remove("Authorization");
      }
    });
  }
}
