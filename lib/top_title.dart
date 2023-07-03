import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class top_title extends StatelessWidget {
  final String title,subtitle;

  const top_title({super.key,required this.subtitle,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const SizedBox(height: kToolbarHeight +12),
          if(title=="login" || title == "Create Acoount")
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            } ,child:  const Icon(Icons.arrow_back),
          ),
          Text( title,
          style: TextStyle(fontSize: 12),
          )
          ,SizedBox(height: 12,),
            Text( subtitle,
            style: TextStyle(fontSize: 4),
            ),
      ],
    );
  }
}