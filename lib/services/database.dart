import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifsports/classes/member.dart';
import 'package:ifsports/classes/user.dart';

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

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      nome: snapshot.data['nome'],
      modalidade: snapshot.data['modalidade'],
      email: snapshot.data['email'],
      avatarUrl: snapshot.data['avatarUrl'],
    );
  }

  // get users stream
  Stream<List<Member>> get members {
    return membersCollection.snapshots().map(_usersListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get membersData {
    return membersCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}
