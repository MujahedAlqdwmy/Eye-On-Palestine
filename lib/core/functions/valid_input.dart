import 'package:get/get.dart';

vaildInput(String val, String type) {
  if (type == 'userName') {
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF]{3,}[a-zA-Z\u0600-\u06FF0-9_]*$')
        .hasMatch(val)) {
      return "Please enter valid username".tr;
    }
  }

  if (type == 'password') {
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(val)) {
      return "Minimum 8 characters \nat least one uppercase letter \nat least one lowercase letter \nat least one number \nat least one special character"
          .tr;
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Please enter valid email".tr;
    }
  }

  if (type == 'url') {
    if (!GetUtils.isURL(val)) {
      return "Please enter valid url".tr;
    }
  }

  if (val.isEmpty) {
    return "Must be not empty".tr;
  }
}
