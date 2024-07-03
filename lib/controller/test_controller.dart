


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
import 'package:uyishi_65/models/test.dart';
import 'package:uyishi_65/services/test_firebase.dart';

class TestControllers extends ChangeNotifier {
  final _testFirebase = TestFirebase();
  final List<Test> _list = [];

  Stream<QuerySnapshot> get list {
    return _testFirebase.getTests();
  }

  void addProduct(Test product) {
    FirebaseFirestore.instance.collection('test').doc(product.id).set({
      'misol': product.misol,
      'javob': product.javob,
    });
    notifyListeners();
  }

  void updateProduct(Test product) {
    FirebaseFirestore.instance.collection('test').doc(product.id).update({
      'misol': product.misol,
      'javob': product.javob,
    });
    notifyListeners();
  }

  void deleteProduct(String id) {
    FirebaseFirestore.instance.collection('test').doc(id).delete();
    notifyListeners();
  }
}