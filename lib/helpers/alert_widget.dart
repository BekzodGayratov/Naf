import 'package:fluttertoast/fluttertoast.dart';

void showNafAlert(String msg) {
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
}
