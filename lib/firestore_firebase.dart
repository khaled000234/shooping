/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/constance.dart';
class firestore_firebase{
static firestore_firebase instance = firestore_firebase();
FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
//Future<List<CategoryModeal>> getCatagories()async{
 // try {
    QuerySnapshot<Map<String,dynamic>>querySnapshot=await _firebaseFirestore.collection("categories").get();
    //List<CategoryModeal>categoriesList= await querySnapshot.docs.map((e) => CategoryModeal.fromJson(e.data()));
  //return categoriesList;
  } catch (e) {
    showMessage(e.toString());
    return[];
  }
}
}

*/