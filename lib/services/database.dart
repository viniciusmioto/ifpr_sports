import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifsports/classes/member.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // colletion reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
    String nome,
    String modalidade,
    String avatarUrl,
  ) async {
    return await usersCollection.document(uid).setData({
      'nome': nome,
      'modalidade': modalidade,
      'avatarUrl': avatarUrl,
    });
  }

  // users from snapshot
  List<Member> _usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Member(
        avatarUrl: doc.data['avatarUrl'] ?? '',
        nome: doc.data['nome'] ?? '',
        modalidade: doc.data['modalidade'] ?? null,
      );
    }).toList();
  }

  // get users stream
  Stream<List<Member>> get users {
    return usersCollection.snapshots().map(_usersListFromSnapshot);
  }
}
