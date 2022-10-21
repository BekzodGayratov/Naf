import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirestoreService {
  static CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  static writeData(
      {required String productName,
      required String productDesc,
      required String productCost,
      required String productImagePath}) async {
    try {
      await products.add({
        "name": productName,
        "about": productDesc,
        "cost": productCost,
        "image": productImagePath
      });
      showNafAlert("productAdded".tr());
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
