import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_delphi/screens/screens.dart';
import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                bottomAppBarColor: Colors.deepPurple,
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light,
              ),
              initialRoute: '/Configuracoes',
              routes: {
                '/Login': (context) => const LoginPage(),
                '/Home': (context) => const HomePage(),
                '/CadastroUser': (context) => const CadastroUser(),
                '/Configuracoes': (context) => const Configuracoes(),
                '/CadastroAnimal': (context) => const CadastroAnimal(),
              });
        });
  }
}
