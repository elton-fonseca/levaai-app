import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'tamanhos_relativos.dart';

class Helpers {
  Helpers();

  static void snackLevaai(
      {@required String texto, @required BuildContext context}) {
    var scnackbar = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 7),
    );
    Scaffold.of(context).showSnackBar(scnackbar);
  }

  static void alerta({BuildContext context, String titulo, String descricao}) {
    showDialog(
      context: context,
      builder: (context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(titulo),
          content: Text(descricao),
          actions: <Widget>[
            // define os botões na base do dialogo
            FlatButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget inputCadastros({
    @required BuildContext context,
    @required String placeholder,
    @required void Function(String) onChange,
    TextInputType teclado = TextInputType.text,
    bool senha = false,
    TextEditingController mascara,
  }) {
    return TextFormField(
      controller: mascara,
      obscureText: senha,
      onChanged: onChange,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: displayWidth(context) * 0.04,
      ),
      keyboardType: teclado,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: Colors.grey[700],
            width: 4,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 20),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey[400],
          fontSize: displayWidth(context) * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static String numeroBr(double valor) {
    var f = NumberFormat('###.00');

    return f.format(valor);
  }

  static String dataBr(DateTime valor) {
    initializeDateFormatting();

    return DateFormat('dd/MM/yyyy').format(valor);
  }

  static String hora(DateTime valor) {
    initializeDateFormatting();

    return DateFormat('HH:mm').format(valor);
  }

  static String mensagemValidacaoAPI(DioError e, String mensagemErro) {
    var mensagem = '';

    if (e.response.statusCode == 422) {
      e.response.data.forEach((campo, erros) {
        mensagem += '$campo: ';
        for (var erro in erros) {
          mensagem += '$erro\n';
        }
      });

      return mensagem;
    }

    return mensagemErro;
  }
}
