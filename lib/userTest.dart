import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/firebase_auth.dart';
//import 'package:flutter_eco/primary_buttom.dart';
//import 'package:provider/provider.dart';

class userTest extends StatefulWidget {
  const userTest({super.key});

  @override
  State<userTest> createState() => _userTestState();
}

class _userTestState extends State<userTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Column(
    children: [
          ListTile(leading: Icon(Icons.login_outlined),title: Text("login out "),
                            onTap: (){
                              firebase_auth.instance.signOut();
                              setState(() {
                                
                              });
                            },
            ),
    ],
   ),
    );
  }
}