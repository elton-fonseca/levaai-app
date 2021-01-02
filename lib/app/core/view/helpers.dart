import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
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
    @required int tamanho,
    @required void Function(String) onChange,
    TextInputType teclado = TextInputType.text,
    bool senha = false,
    TextEditingController mascara,
  }) {
    return TextFormField(
      controller: mascara,
      obscureText: senha,
      onChanged: onChange,
      inputFormatters: [
        LengthLimitingTextInputFormatter(tamanho),
      ],
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

  static String pegarSiglaEstado(String nomeEstado) {
    final estados = <String, String>{
      "Acre": "AC",
      "Alagoas": "AL",
      "Amapá": "AP",
      "Amazonas": "AM",
      "Bahia": "BA",
      "Ceará": "CE",
      "Distrito Federal": "DF",
      "Espírito Santo": "ES",
      "Goiás": "GO",
      "Maranhão": "MA",
      "Mato Grosso": "MT",
      "Mato Grosso do Sul": "MS",
      "Minas Gerais": "MG",
      "Paraná": "PR",
      "Paraíba": "PB",
      "Pará": "PA",
      "Pernambuco": "PE",
      "Piauí": "PI",
      "Rio Grande do Norte": "RN",
      "Rio Grande do Sul": "RS",
      "Rio de Janeiro": "RJ",
      "Rondônia": "RO",
      "Roraima": "RR",
      "Santa Catarina": "SC",
      "Sergipe": "SE",
      "São Paulo": "SP",
      "Tocantins": "TO"
    };

    return estados[nomeEstado];
  }

  static String prazoDescricao(String prazo, String tipo) {
    if (prazo == "0" || prazo == null) {
      return "DINÂMICO.";
    }

    if (tipo == 'COLETA' && prazo == "1") {
      return "$prazo DIA ÚTIL";
    }

    if (tipo == 'COLETA' && prazo == "2") {
      return "$prazo DIAS ÚTEIS";
    }

    if (tipo == 'ENTREGA' && prazo == "1") {
      return "$prazo DIA APÓS A COLETA";
    }

    return "$prazo DIAS APÓS A COLETA";
  }

  static String montaEndereco(Address address) {
    var cidade, estado;

    if (Platform.isAndroid) {
      cidade = address.subAdminArea;
      estado = Helpers.pegarSiglaEstado(address.adminArea);
    } else {
      cidade = address.locality;
      estado = address.adminArea;
    }

    return "${address.thoroughfare}, ${address.subLocality ?? ''}, $cidade - "
        "$estado";
  }
}
