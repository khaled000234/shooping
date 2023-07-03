import 'dart:convert';

//import 'package:firebase_auth/firebase_auth.dart';
Prodectmodal prodectModelFromJson(String str)=> Prodectmodal.fromJson(json.decode(str));
String prodectModelToJson(Prodectmodal data) => json.encode(data.toJson());
class Prodectmodal {
  Prodectmodal({
    required this.id,
   required this.name,
   //required this.email,
   required this.price,
   required this.decoration,
   required this.status,
      required this.isFavourite,
      required this.image,
      this.con,
   });
   String id;
   String image;
   bool isFavourite;
   String name;

   double price;
   String decoration;
   String status;
   int? con;
   factory Prodectmodal.fromJson(Map<String,dynamic>json) => Prodectmodal(
    id: json["id"],
     name:  json["name"],
      decoration: json["decoration"],
    image: json["image"],
    con:json["con"],
     isFavourite:false ,
      price: double.parse(json["price"].toString()),
     status: json["status"],
     );
     Map<String, dynamic> toJson()=>{
      "id":id,
      "name":name,
      "image":image,
      "description":decoration,
      "isFavourite":isFavourite,
      "price":price,
      "status":status,
      "con":con,
     };
 
    Prodectmodal copyWith({
int? con,
    }) => Prodectmodal(
id: id,

     name: name,
      decoration: decoration,
    image:image,
    con:con??this.con,
     isFavourite:false ,
      price: price,
     status:status,

    );
}