import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _workerCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getBestWorker() async {
    var value = await _workerCollectionRef.get();

    return value.docs;
  }
}