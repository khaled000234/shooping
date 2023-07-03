import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/Edit_profile.dart';
import 'package:flutter_eco/OrderScreen.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/change_password.dart';
import 'package:flutter_eco/favorite_scann.dart';
import 'package:flutter_eco/firebase_auth.dart';
import 'package:flutter_eco/primary_buttom.dart';
//import 'package:flutter_eco/prodect_detail.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:provider/provider.dart';

class accountScreen extends StatefulWidget {
  const accountScreen({super.key});

  @override
  State<accountScreen> createState() => _accountScreenState();
}

class _accountScreenState extends State<accountScreen> {
  @override
  Widget build(BuildContext context) {
     AppProvider appProvider= Provider.of<AppProvider>(context);
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  title: const Text("perosn",style: TextStyle(color: Colors.black),),
),
body: Column(
  children: [
    Expanded(child: Column(
      children:  [
      appProvider.getuserinforamtion.image ==null
        ? const
Icon(Icons.person_2_outlined,size: 110,): 
CircleAvatar(backgroundImage: NetworkImage(appProvider.getuserinforamtion.image!),radius: 70,),


//Image.network(appProvider.getuserinforamtion.image!),
Text(appProvider.getuserinforamtion.name,
style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
Text(appProvider.getuserinforamtion.email,

style: TextStyle(fontSize: 14),),
SizedBox(height: 8,),
SizedBox(width: 100, child: primayButtom(title: "Edit",onPressed: (){
    Routes.instance.push( widget: Edit_profile(),
  context: context);
},)),
      ],
    ),),
    Expanded(flex: 2,
      child: Container(
        child:Column(
          children: [
            ListTile(leading: Icon(Icons.shopping_bag_outlined),title: Text("your order"),
            onTap: (){
               Routes.instance
                        .push(widget: const OrderScreen(), context: context);
            },
            ),
             
              ListTile(leading: Icon(Icons.favorite_outline),title: Text("favorite"),
                onTap: (){
                  Routes.instance.push(
                        widget: const favorite_scann(), context: context);
                },
            ),
              ListTile(leading: Icon(Icons.info_outline),title: Text("password change"),
                onTap: (){
                   Routes.instance
                          .push(widget: const ChangePassword(), context: context);
                },
            ),
                          ListTile(leading: Icon(Icons.superscript_outlined),title: Text("support"),
                            onTap: (){},
            ),
            ListTile(leading: Icon(Icons.login_outlined),title: Text("login out "),
                            onTap: (){
                              firebase_auth.instance.signOut();
                              setState(() {
                                
                              });
                            },
            ),
             const SizedBox(height: 12,),
             const Text("verstion 1.0.0")

          ],
        ) ,
      ),
    
    )
  ],
),
    );
  }
}