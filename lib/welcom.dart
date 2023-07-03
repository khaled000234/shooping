import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/cons.dart';
import 'package:flutter_eco/login.dart';
import 'package:flutter_eco/primary_buttom.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:flutter_eco/sing_in.dart';
import 'package:flutter_eco/top_title.dart';


class welcom extends StatelessWidget {
  const welcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          top_title(subtitle:"buy any thike " , title: "welcome th s"),
              
        Center(
          child: Image.asset(AssetsImages.instance.welcomimage),
          
        
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CupertinoButton(
              onPressed: (){},
              child: Icon(Icons.facebook,size: 35,color: Colors.blueAccent,)),
            const SizedBox(width: 13,),
                 CupertinoButton( onPressed: (){},
                  child: Icon(Icons.access_alarm,size: 35,color: Colors.blueAccent,))
          ],
        ),
        const SizedBox(height: 9.0,),
          primayButtom(title: "login ", onPressed:(){
            Routes.instance.push(widget: const login_in(), context:context);
          }),
          SizedBox(height: 9),
          primayButtom(title: "sing in ", onPressed: (){
                 Routes.instance.push(widget: const sing_in(), context:context);
          },),
          ],
          ),
        ),
      ),
    );
  }
}