import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_delphi/Utils/app_controller.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Tema Escuro: '),
                Switch(
                    value: AppController.instance.isDarkTheme,
                    onChanged: (value) {
                      AppController.instance.changeTheme();
                    }),
              ]),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/Home');
            },
            child: Text('Voltar'),
          )
        ],
      ),
    ));
  }
}
