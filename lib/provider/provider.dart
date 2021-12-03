import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  late String email;
  late int valul;
  postData(email,valul) {
    FirebaseDatabase.instance.reference().child(email).set(valul);
    notifyListeners();
  }

  
}
