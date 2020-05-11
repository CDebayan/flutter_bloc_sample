
import 'package:email_validator/email_validator.dart';

class Functionality {
  static List validatePassword(String password) {
    List list = List(2);
    if (password.isEmpty) {
      list[0] = false;
      list[1] = 'Please enter password';
      return list;
    } else if (password.length < 4) {
      list[0] = false;
      list[1] = 'Password length should be greater than 3';
      return list;
    } else {
      list[0] = true;
      list[1] = null;
      return list;
    }
  }

  static List validateEmail(String email) {
    List list = List(2);
    if (email.isEmpty) {
      list[0] = false;
      list[1] = 'Please enter email';
      return list;
    } else if (!EmailValidator.validate(email)) {
      list[0] = false;
      list[1] = 'Please enter valid email';
      return list;
    } else {
      list[0] = true;
      list[1] = null;
      return list;
    }
  }

}
