import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive/helpers/alert_widget.dart';

class FirestoreService {
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  writeData(
      {required String productName, required String productImagePath}) async {
    try {
      await products.add({"name": productName, "image": productImagePath});
    } on FirebaseException catch (e) {
      showNafAlert(e.message.toString());
    }
  }
}
