import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/Customer_bottom_bar.dart';
import 'package:flutter_eco/Home.dart';
import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/login.dart';
import 'package:flutter_eco/firebase_auth.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_eco/primary_buttom.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:flutter_eco/top_title.dart';
class sing_in extends StatefulWidget {
  const sing_in({super.key});

  @override
  State<sing_in> createState() => _sing_inState();

}

class _sing_inState extends State<sing_in> {
    TextEditingController email =TextEditingController();
  TextEditingController password=TextEditingController();
    TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  bool isshowpassword =true;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              top_title(subtitle: "sing in  ", title:"thank you to use the appljcation"),
              SizedBox(height: 46,),
              TextFormField(
                controller:name ,
                decoration: const InputDecoration(
                  hintText: "name ",iconColor: Colors.grey,
                  prefixIcon: Icon(Icons.near_me)
                ),
              ),
               TextFormField(
                controller:email ,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "E_Email",iconColor: Colors.grey,
                  prefixIcon: Icon(Icons.email_outlined)
                ),
              ),
               TextFormField(
                controller:phone ,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "phone",iconColor: Colors.grey,
                  prefixIcon: Icon(Icons.phone)
                ),
              ),
              
              SizedBox(height: 12.0,),
               TextFormField(
                controller:password,
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
              primayButtom(title: "login in ",onPressed: ()async{
                  bool  isVaildated=sigin_inVaildation(email.text, password.text,name.text,phone.text);
             if(isVaildated){
             bool isLogined = await firebase_auth.instance.sing_in(name.text,email.text, password.text, context);
              if(isLogined){
                Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);
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
                  onPressed: ()async{
                         bool  isVaildated=sigin_inVaildation(email.text, password.text,name.text,phone.text);
             if(isVaildated){
             bool isLogined = await firebase_auth.instance.sing_in(name.text,email.text, password.text, context);
              if(isLogined){
                Routes.instance.pushAndRemoveUntil(widget: const ProvidedStylesExample(), context: context);
              }
             }
                  },child: Text("Create an account ", style: TextStyle(color: Theme.of(context).primaryColor),),
                )
              )
            ],
          ),
        ),
      ),
    ) ;
  }
}