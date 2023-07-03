
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/primary_buttom.dart';
//import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/wigite.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
   
 AppProvider appProvider= Provider.of<AppProvider>(context);
    return Scaffold(
  appBar: AppBar(title: const Text("card screen order ",
  style: TextStyle(color: Colors.blue),) ,),
      body: appProvider.getcartProviderList.isEmpty? Center(child: Text("Empty"),): ListView.builder(
              itemCount: appProvider.getcartProviderList.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (ctx, index) {
                return singlecardItem(singleprodect: appProvider.getcartProviderList[index],
                );
                  
                
              }
              ),
    );
  }
}