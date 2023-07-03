import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class primayButtom extends StatelessWidget {

  final void Function()? onPressed;
  final String title;
  const primayButtom({super.key, this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(onPressed:onPressed, 
        child:  Text(title)),
      );
  }
}