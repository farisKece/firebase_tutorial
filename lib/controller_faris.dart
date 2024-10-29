import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FarisController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var bukuJson = <Map<String, dynamic>>[].obs;
  // @override
  // void onInit() {
  //   fetchBuku();
  //   super.onInit();
  // }

  @override
  void onInit() {
    _listenToUserStream();
    super.onInit();
  }

  // Future<void> getRakData() async {
  //   try {
  //     final QuerySnapshot snapshot =
  //         await firestore.collection('rak-buku').get();

  //     List<Map<String, dynamic>> userList = snapshot.docs.map((doc) {
  //       return {
  //         'id': doc.id, // Menyimpan ID dokumen
  //         ...doc.data() as Map<String, dynamic>, // Menggabungkan data dokumen
  //       };
  //     }).toList();

  //     userJson.value = jsonEncode({'rak-buku': userList});
  //   } catch (e) {
  //     userJson.value = jsonEncode({'error': 'Failed to fetch rak-buku'});
  //   }
  // }

  // Future<QuerySnapshot<Map<String,dynamic>>> getRakData() async {
  //   return FirebaseFirestore.instance.collection('rak-buku').get();
  // }

  // void fetchBuku() async {
  //   final QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('rak-buku').get();
  //   bukuJson.value =
  //       snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  // }
  void _listenToUserStream() {
    firestore.collection('rak-buku').snapshots().listen((querysnapshot) {
      print(
          "Data changed in Firestore: ${querysnapshot.docs.length} documents found.");

      // Logging isi data
      for (var doc in querysnapshot.docs) {
        print(doc.data());
      }

      bukuJson.value = querysnapshot.docs
          .map((doc) => doc.data())
          .toList();
    });
  }

  String convertToJson() {
    return bukuJson.toString();
  }
}
