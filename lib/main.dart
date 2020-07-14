import 'package:extra_flutter_expanded_screen/expanded_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenExpanded(),
    );
  }
  @override
  void dispose() {
    _enableRotation();
  }
}



//para editar a orientação da tela
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
//para desativar a rotaçao da tela
void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
