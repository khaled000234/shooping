import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/Customer_bottom_bar.dart';
//import 'package:flutter_eco/Home.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/firebase_auth.dart';
import 'package:flutter_eco/firebase_opertion.dart';
//import 'package:flutter_eco/homePage.dart';
import 'package:flutter_eco/themeData.dart';
//C:\Flutter0\flutter_eco\login\login.dart
import 'package:flutter_eco/welcom.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  DefaultFirebaseConfing.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context)=>AppProvider() ,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "my firest app",
      theme: themeData,
      home: StreamBuilder( stream:  firebase_auth.instance.getAuthChange,
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return const ProvidedStylesExample();
            
          }
          return const welcom();
        } ),
    ),
    );
  }
}
