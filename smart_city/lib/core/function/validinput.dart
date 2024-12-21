import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "isempty".tr;
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "notvalidusername".tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "notvalidemail".tr;
    }
  }

  if (val.length < min) {
    return "notvalidmin".trParams({"min": "$min"});
  }
  if (val.length > max) {
    return "notvalidmax".trParams({"max": "$max"});
  }
}
