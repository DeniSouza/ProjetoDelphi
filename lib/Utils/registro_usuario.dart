import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_delphi/Utils/utils.dart';

class ExcecaoRegistroUsuario implements Exception {
  String mensagem;
  ExcecaoRegistroUsuario(this.mensagem);
}

class RegistroUsuario extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthService auth;
  String nome = '';
  String idade = '';

  RegistroUsuario({required this.auth}) {
    _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  registraUsuario(String nome, String idade, String email) async {
    await db
        .collection('usuario/${auth.usuario!.uid}/Dados')
        .doc('Pessoais')
        .set({
      'nome': nome,
      'idade': idade,
      'email': email,
    });
    notifyListeners();
  }

  lerDadosUsuario(nome) async {
    nome = db
        .collection("usuario/${auth.usuario!.uid}/Dados")
        .get()
        .then((nome.docs.forEach)((result) {
          db
              .collection("usuario/${auth.usuario!.uid}/Dados")
              .doc(result.nome)
              .collection("Pessoais")
              .get()
              .then((querySnapshot) => {
                    querySnapshot.docs.forEach((info) {
                      var result = info.data();
                      nome = nome.fromJson(result);
                    })
                  });
        }));
  }

  apagarUsuario() async {
    {
      await db
          .collection('usuario/${auth.usuario!.uid}/Dados')
          .doc('Pessoais')
          .delete();
    }
    notifyListeners();
  }
}
