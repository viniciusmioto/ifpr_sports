import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // colletion reference
  final CollectionReference atletasCollection =
      Firestore.instance.collection('atletas');

  Future updateUserData(
      String nome, String modalidade, String avatarUrl) async {
    return await atletasCollection.document(uid).setData({
      'nome': nome,
      'modalidade': modalidade,
      'avatarUrl': avatarUrl,
    });
  }

  //get Atletas stream
  Stream<QuerySnapshot> get atletas {
    return atletasCollection.snapshots();
  }
}
