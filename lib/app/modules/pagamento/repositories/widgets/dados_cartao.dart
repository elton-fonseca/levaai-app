import 'package:flutter/material.dart';
import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class DadosCartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                          width: 4,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Nome (mesmo do cartao)',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[400],
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //suffixIcon: Image(
                      //  width: displayWidth(context) * 0.05,
                      //  image: AssetImage(
                      //    'assets/creditcard.png',
                      //  ),
                      //),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                          width: 4,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Número do cartão',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[400],
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.025,
            right: displayWidth(context) * 0.025,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                          width: 4,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Código',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[400],
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: displayWidth(context) * 0.05),
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: BorderSide(
                          color: Colors.grey[700],
                          width: 4,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Validade',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[400],
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
