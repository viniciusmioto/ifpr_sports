import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  // colletion reference
  final CollectionReference atletasCollection = Firestore.instance.collection('atletas');

}