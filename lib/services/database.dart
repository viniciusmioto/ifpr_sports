import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifsports/classes/member.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // colletion reference
  final CollectionReference membersCollection =
      Firestore.instance.collection('members');

  Future updateUserData(
    String nome,
    String modalidade,
    String avatarUrl,
    String email,
  ) async {
    return await membersCollection.document(uid).setData({
      'nome': nome,
      'modalidade': modalidade,
      'avatarUrl': avatarUrl,
      'email': email,
    });
  }

  // users from snapshot
  List<Member> _usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Member(
        avatarUrl: doc.data['avatarUrl'] ?? '',
        nome: doc.data['nome'] ?? '',
        email: doc.data['email'] ?? '',
        modalidade: doc.data['modalidade'] ?? null,
      );
    }).toList();
  }

  // get users stream
  Stream<List<Member>> get members {
    return membersCollection.snapshots().map(_usersListFromSnapshot);
  }
}
