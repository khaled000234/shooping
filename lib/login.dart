// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/Customer_bottom_bar.dart';
//import 'package:flutter_eco/Home.dart';
import 'package:flutter_eco/constance.dart';
import 'package:flutter_eco/firebase_auth.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_eco/primary_buttom.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:flutter_eco/sing_in.dart';
import 'package:flutter_eco/top_title.dart';
class login_in extends StatefulWidget {
  const login_in({super.key});

  @override
  State<login_in> createState() => _login_inState();

}

class  _login_inState extends State<login_in> {

  TextEditingController email =TextEditingController();
  TextEditingController password=TextEditingController();
  bool isshowpassword =true;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:  Column(
        children: [
          top_title(subtitle: "login in ", title:"thank you to use the appljcation"),
          SizedBox(height: 46,),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              hintText: "E_Email",iconColor: Colors.grey,
              prefixIcon: Icon(Icons.email_outlined)
            ),
          ),
          SizedBox(height: 12.0,),
           TextFormField(
            controller:  password,
            obscureText: isshowpassword,
            decoration:  InputDecoration(
              hintText: "password",iconColor: Colors.grey,
              prefixIcon: Icon(Icons.password_sharp),
              suffixIcon: CupertinoButton( onPressed:(){
                setState(() {
                  isshowpassword = !isshowpassword;
                  print(isshowpassword);
                });
           
              },
                 padding:EdgeInsets.zero,
              child:const Icon(Icons.visibility, color: Colors.grey,),
              ),
            ),
          ),
          SizedBox(height: 9,),
          primayButtom(title: "login in ",onPressed: () async{
             bool  isVaildated=loginVaildation(email.text, password.text);
             if(isVaildated){
             bool isLogined=await  firebase_auth.instance.login(email.text, password.text, context);
              if(isLogined){
                Routes.instance.pushAndRemoveUntil(widget: const ProvidedStylesExample(), context: context);
              }
             }

          },),
          const SizedBox(height: 24,),
          const Center(
            child:  Text("Dont have an Acoount ",
            ),
            

          ),
          const SizedBox(height: 12,),
          Center(
            child:  CupertinoButton(
              onPressed: (){
                  Routes.instance.push(widget: const sing_in(), context:context);
              },child: Text("Create an account ", style: TextStyle(color: Theme.of(context).primaryColor),),
            )
          )
        ],
      ),
    ) ;
  }
}