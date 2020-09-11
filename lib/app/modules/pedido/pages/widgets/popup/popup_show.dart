import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'popup_corpo.dart';
import 'popup_medida_exata.dart';

class PopupShow extends StatefulWidget {
  final Widget content;

  PopupShow({
    Key key,
    this.content,
  }) : super(key: key);

  _PopupShowState createState() => _PopupShowState();

  // ignore: type_annotate_public_apis
  showPopup(BuildContext context, String title, {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupMedidaExata(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: PopupShow(
          content: Scaffold(
            backgroundColor: Color(0xFF326699).withOpacity(0.9),
            appBar: AppBar(
              backgroundColor: Color(0xFF326699).withOpacity(0.9),
              elevation: 0,
              title: Text(''),
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            resizeToAvoidBottomPadding: false,
            body: PopupCorpo(),
          ),
        ),
      ),
    );
  }
}

class _PopupShowState extends State<PopupShow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}
