import 'dart:io';

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/app_provider.dart';
//import 'package:flutter_eco/constance.dart';
//import 'package:flutter_eco/firebase_auth.dart';
import 'package:flutter_eco/primary_buttom.dart';
import 'package:flutter_eco/user_modal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  File? image;
  void takePicture()async{
    XFile? value =await ImagePicker().pickImage(source: ImageSource.gallery);
    if (value !=null) {
      setState(() {
        image=File(value.path);
      });
    }
  }
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
      AppProvider appProvider= Provider.of<AppProvider>(context);
    return Scaffold(
        
        appBar: AppBar(backgroundColor: Colors.white,
        title: const Text("profile",style: TextStyle(color: Colors.black),),
        
        ),
        body:   ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          image == null
              ? CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: const CircleAvatar(
                      radius: 55, child: Icon(Icons.camera_alt)),
                )
              : CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 55,
                  ),
                ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: appProvider.getuserinforamtion.name,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          primayButtom(
            title: "Update",
            onPressed: () async {
              Usermodal usermodal = appProvider.getuserinforamtion
                  .copyWith(name: textEditingController.text);
              appProvider.updateUserInoformation(context, usermodal, image);
            
            },
          ),
        ],
      ),
    );
  }
}