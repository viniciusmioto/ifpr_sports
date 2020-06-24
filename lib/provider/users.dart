import 'package:flutter/material.dart';
import 'package:ifsports/data/dummy_users.dart';
import 'package:ifsports/pages/user.dart';

class UsersProvider with ChangeNotifier {
  Map<String, User> _items = {... DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  

}