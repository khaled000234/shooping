import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eco/category_model.dart';
import 'package:flutter_eco/constance.dart';
import 'package:flutter_eco/order_model.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/user_modal.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }



  Future<List<Prodectmodal>> getbestProdect() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();

      List<Prodectmodal> ProdectmodalList = querySnapshot.docs
          .map((e) => Prodectmodal.fromJson(e.data()))
          .toList();

      return ProdectmodalList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

 


  Future<List<Prodectmodal>> getCategoryViewProduct(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection("categories")
              .doc(id)
              .collection("products")
              .get();

      List<Prodectmodal> ProdectmodalList = querySnapshot.docs
          .map((e) => Prodectmodal.fromJson(e.data()))
          .toList();

      return ProdectmodalList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }



  Future<Usermodal> getuserinforamtion() async {
  DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFirestore
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

    return Usermodal.fromJson(querySnapshot.data()!);

}

 // uploadimagek(File file) {}



Future<bool> uploadOrderedProductFirebase(
      List<Prodectmodal> list, BuildContext context, String payment) async {
    try {
      showLoadingDialoag(context);
      double totalPrice = 0.0;
      for (var element in list) {
        totalPrice += element.price * element.con!;
      }
      DocumentReference documentReference = _firebaseFirestore
          .collection("usersOrders")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("orders")
          .doc();
      DocumentReference admin = _firebaseFirestore.collection("orders").doc();

      admin.set({
        "products": list.map((e) => e.toJson()),
        "status": "Pending",
        "totalPrice": totalPrice,
        "payment": payment,
        "orderId": admin.id,
      });
      documentReference.set({
        "products": list.map((e) => e.toJson()),
        "status": "Pending",
        "totalPrice": totalPrice,
        "payment": payment,
        "orderId": documentReference.id,
      });
      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Ordered Successfully");
      return true;
    } catch (e) {
      showMessage(e.toString());
      Navigator.of(context, rootNavigator: true).pop();
      return false;
    }
  }


  Future<List<OrderModel>> getUserOrder() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
              .collection("usersOrders")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("orders")
              .get();

      List<OrderModel> orderList = querySnapshot.docs
          .map((element) => OrderModel.fromJson(element.data()))
          .toList();

      return orderList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  void updateTokenFromFirebase() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await _firebaseFirestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "notificationToken": token,
      });
    }
  }
}


