import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/strings.dart';

class MyProvider with ChangeNotifier {
  late String email;
  late int valul;
  var _user;
  late bool looding = false;

  increase() {
    valul++;

    notifyListeners();
  }

  decrease() {
    valul--;

    notifyListeners();
  }

  onexit() {
    FirebaseDatabase.instance.reference().child(email).set(valul);
  }

  getinstance(useremail, context) {
    looding = true;
    notifyListeners();
    _user = FirebaseDatabase.instance.reference().onValue.listen((event) {
      final date = Map<dynamic, dynamic>.from(event.snapshot.value);

      final user = date["$useremail"];

      if (user != null) {
        valul = user;
        email = useremail;

        Navigator.pushReplacementNamed(
          context,
          myHomePage,
        );
        looding = false;
        notifyListeners();
        _user.cancel();
      } else {
        valul = 0;

        postData(useremail, 0);
      }
    });
  }

  postData(email, valul) {
    FirebaseDatabase.instance.reference().child(email).set(valul);
    notifyListeners();
  }
}
