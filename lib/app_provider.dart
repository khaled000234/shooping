// ignore_for_file: use_build_context_synchronously

import 'dart:io';
//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/firebase_auth.dart';
//import 'package:flutter_eco/firebase_auth.dart';
import 'package:flutter_eco/firebase_firestore.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/user_modal.dart';
import 'package:flutter_eco/firebase_storage_helper.dart';

class AppProvider with ChangeNotifier {
  List<Prodectmodal>_cartProviderList=[];
    final List<Prodectmodal> _buyProductList = [];
     final List<Prodectmodal>_favoriteProviderList=[];
   Usermodal? _usermodal;

  Usermodal get getuserinforamtion => _usermodal!;
  void addCartProvider( Prodectmodal prodectmodal){
    _cartProviderList.add(prodectmodal);
    notifyListeners();


  }
    void removeCartProvider( Prodectmodal prodectmodal){
    _cartProviderList.remove(prodectmodal);
    notifyListeners();


  }
  List<Prodectmodal> get getcartProviderList=> _cartProviderList;
 


  
   
  void addfavorite( Prodectmodal prodectmodal){
    _favoriteProviderList.add(prodectmodal);
    notifyListeners();


  }
    void removefavorite( Prodectmodal prodectmodal){
    _favoriteProviderList.remove(prodectmodal);
    notifyListeners();


  }
  List<Prodectmodal> get getfavoriteProviderList=> _favoriteProviderList;
 
void getUserInfoFirebase() async {
    _usermodal = await FirebaseFirestoreHelper.instance.getuserinforamtion();
    notifyListeners();
  }
void updateUserInoformation ( BuildContext context,
  Usermodal usermodal,File? file)async{
    
  if (file ==null) {
    showLoadingDialoag(context);
    _usermodal =usermodal;
     await
    FirebaseFirestore.instance.collection("users")
    .doc(_usermodal!.id).
    set(_usermodal!.toJson());
     // showMessage("succsful update");
      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();
  }else{
     showLoadingDialoag(context);
   String imageUrl=await FirebaseStorageHelper.instance.uploadUserImage(file);
_usermodal=usermodal.copyWith(image: imageUrl);
await  FirebaseFirestore.instance.collection("users").doc(_usermodal!.id)
.set(_usermodal!.toJson());
Navigator.of(context,rootNavigator: true).pop();
Navigator.of(context).pop();

 
 
  }
 showMessage("succsful update");
notifyListeners();
}

  double totalPrice() {
    double totalPrice = 0.0;
    for (var element in _cartProviderList) {
      totalPrice += element.price * element.con!;
    }
    return totalPrice;
  }

  double totalPriceBuyProductList() {
    double totalPrice = 0.0;
    for (var element in _buyProductList) {
      totalPrice += element.price * element.con!;
    }
    return totalPrice;
  }

  void updateQty(Prodectmodal productModel, int con) {
    int index = _cartProviderList.indexOf(productModel);
    _cartProviderList[index].con = con;
    notifyListeners();
  }
 

  void addBuyProduct(Prodectmodal model) {
    _buyProductList.add(model);
    notifyListeners();
  }

  void addBuyProductCartList() {
    _buyProductList.addAll(_cartProviderList);
    notifyListeners();
  }

  void clearCart() {
    _cartProviderList.clear();
    notifyListeners();
  }

  void clearBuyProduct() {
    _buyProductList.clear();
    notifyListeners();
  }

List<Prodectmodal> get getBuyProductList => _buyProductList;
}