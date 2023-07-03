import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/ca/single_favorite.dart';
//import 'package:flutter_eco/wigite.dart';
import 'package:provider/provider.dart';

class favorite_scann extends StatefulWidget {
  const favorite_scann({super.key});

  @override
  State<favorite_scann> createState() => _favorite_scannState();
}

class _favorite_scannState extends State<favorite_scann> {
  @override
  Widget build(BuildContext context) {
     AppProvider appProvider= Provider.of<AppProvider>(context);
    return Scaffold(
  appBar: AppBar(title: const Text("favoirde cart ",
  style: TextStyle(color: Colors.blue),) ,),
      body: appProvider.getfavoriteProviderList.isEmpty? Center(child: Text("Empty"),): ListView.builder(
              itemCount: appProvider.getfavoriteProviderList.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (ctx, index) {
                return singlefavorite(singleprodect: appProvider.getfavoriteProviderList[index],
                );
                  
                
              }
              ),
    );
  }
  
}