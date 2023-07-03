//import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/firebase_firestore.dart';
import 'package:flutter_eco/order_model.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/user_modal.dart';

class firebase_auth{
  static firebase_auth instance =firebase_auth();
final FirebaseAuth _auth=FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Stream <User?> get  getAuthChange=>_auth.authStateChanges();
Future<bool> login(
  String email ,String password ,BuildContext context
)async{
  try {
    showLoadingDialoag(context);
    await _auth.signInWithEmailAndPassword(email: email, password: password);
 


  Navigator.of(context).pop();

  
  return true;
  } on FirebaseAuthException  catch(error){
     Navigator.of(context).pop();
    showMessage(error.code.toString());
    return false;
  }
}

Future<bool> sing_in( 
 String name, String email ,String password ,BuildContext context
)async{
  try {
    showLoadingDialoag(context);
  
  UserCredential userCredential=  await _auth.
  createUserWithEmailAndPassword(email: email, password: password);
 
Usermodal usermodal=Usermodal(
  id: userCredential.user!.uid, name:name , email: email,image: null);
 _firestore.collection("users").doc(usermodal.id).set(usermodal.toJson());
  Navigator.of(context).pop();
  return true;
  } on FirebaseAuthException  catch(error){
     Navigator.of(context).pop();
    showMessage(error.code.toString());
    return false;
  }
}


void signOut()async{
  await _auth.signOut();
}


 Future<bool> changePassword(
      String password, BuildContext context) async {
    try {
      showLoadingDialoag(context);
      _auth.currentUser!.updatePassword(password);
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // UserModel userModel = UserModel(
      //     id: userCredential.user!.uid, name: name, email: email, image: null);

      // _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context,rootNavigator: true).pop();
      showMessage("Password Changed");
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context,rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

Future<List<OrderModel>> getUserOrder() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore
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


  Future<bool> uploadOrderedProductFirebase(
      List<Prodectmodal> list, BuildContext context, String payment) async {
    try {
      showLoadingDialoag(context);
      double totalPrice = 0.0;
      for (var element in list) {
        totalPrice += element.price * element.con!;
      }
      DocumentReference documentReference = _firestore
          .collection("usersOrders")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("orders")
          .doc();
      DocumentReference admin = _firestore.collection("orders").doc();

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


  void updateTokenFromFirebase() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await _firestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "notificationToken": token,
      });
    }
  }

}





