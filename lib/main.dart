import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';
import 'app/app_module.dart';


 void main() {
    WidgetsFlutterBinding.ensureInitialized();   
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
                .then((_){
                  runApp(ModularApp(module: AppModule()));
                });
 }