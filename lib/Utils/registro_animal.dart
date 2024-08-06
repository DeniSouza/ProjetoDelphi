import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_delphi/Utils/utils.dart';

class ExcecaoRegistroAnimal implements Exception {
  String mensagem;
  ExcecaoRegistroAnimal(this.mensagem);
}

class RegistroAnimal extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthService auth;

  RegistroAnimal({required this.auth}) {
    _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  registraAnimal(String nome, String idade, String especie, String raca) async {
    await db
        .collection('usuario/${auth.usuario!.uid}/Dados')
        .doc('Animais de Estimação')
        .set({
      'nome': nome,
      'idade': idade,
      'raça': raca,
      'especie': especie,
    });
    notifyListeners();
  }

  lerDadosAnimal() {}
}
