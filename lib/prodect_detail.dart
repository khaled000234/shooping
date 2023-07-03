

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/ca/checkout_help.dart';
import 'package:flutter_eco/cart_screen.dart';
import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/favorite_scann.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:provider/provider.dart';

class Prodect_Details extends StatefulWidget {
  final Prodectmodal singleprodect;
  const Prodect_Details({super.key,required this.singleprodect});

  @override
  State<Prodect_Details> createState() => _Prodect_DetailsState();
}

class _Prodect_DetailsState extends State<Prodect_Details> {
  int con=1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          Routes.instance.push(widget: CartScreen(), context: context);

        }, icon: const Icon(Icons.shopping_cart))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.network(widget.singleprodect.image,
            width: 350,height: 350, ),
        
        
        
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.singleprodect.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: (){
               setState(() {
            widget.singleprodect.isFavourite=!widget.singleprodect.isFavourite;
               });
               if(widget.singleprodect.isFavourite){
                appProvider.addCartProvider(widget.singleprodect);
                showMessage("add secssful");
               }else{
                  appProvider. removeCartProvider(widget.singleprodect);
                  showMessage("add NOt  secssful");
               }
              }, icon:Icon(widget.singleprodect.isFavourite 
              ? Icons.favorite
               :Icons.favorite_border
              ),
              ),
          ],
              ),
              Text(widget.singleprodect.decoration),
              const SizedBox(height: 6.0),
              Row(
          children: [
           CupertinoButton( onPressed: (){
             setState(() {
              if(con>=1){
           con--;
              }
           
            });
           },
             child: Padding(padding: EdgeInsets.zero,
             child: const CircleAvatar(child: Icon(Icons.remove),),),
           ),
           Text(con.toString(),style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
           const SizedBox(
            width: 7,
           ),
           CupertinoButton(onPressed: (){
            setState(() {
              con++;
            });
           },
           padding: EdgeInsets.zero,
            child: const CircleAvatar(
           child: Icon(Icons.add),),),
          ],
              ),
             // Spacer(),
              Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
        OutlinedButton(onPressed: (){
         
       //  AppProvider appProvider= Provider.of<AppProvider>(context,listen:false );
        Prodectmodal prodectmodal= widget.singleprodect.copyWith(con: con);
         appProvider.addCartProvider(prodectmodal);
         showMessage("Adder to part");
        }, child: Text("add the card")),
        SizedBox(height: 5,),
        SizedBox(
          height: 30,
          width: 140,
          child: ElevatedButton(onPressed: (){
           
             Prodectmodal productModel =
                            widget.singleprodect.copyWith(con: con);
                        Routes.instance.push(
                            widget: Checkout(singleProduct: productModel),
                            context: context);

          }, child: Text("BUY"))),
              ],),
              SizedBox(height: 50.0),
          ],),
        ),
      ),
    );
  }
}