import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
         ===========
         TODO: Step - 2 [User Repository to perform Database Operations -CRUD-]
         ===========
 */

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

   // store user in FireStore
  Future<bool> createUser(UserModel user) async {
    bool success = false;
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar('Success', 'Your account has been created',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
      success = true;
    }).catchError((error, stackTrace) {
      success = false;
      Get.snackbar('Error', 'Something went Wrong. Try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      log(error.toString());
      FutureOr<DocumentReference<Map<String, dynamic>>> x =
          {} as FutureOr<DocumentReference<Map<String, dynamic>>>;
      return x;
    });

    return success;
  }

// Fetch User Details
Future<UserModel> getUserDetails(String email)async{
    final snapshot = await _db.collection('Users').where('Email', isEqualTo:email ).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
}


}
