import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){


Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );



}
showLoadingDialoag(BuildContext context){
  AlertDialog alert =AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color:Color(0xffe16555),
          ),
          const SizedBox(height: 18.0),Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading..."),
          )
        ],
      ),);
    },),
  );
  showDialog(
    barrierDismissible: false,
    context:context , builder: (BuildContext context) {
      return alert;
    },);
}
/*String getMessageFromCode(String errorCode){
  switch (errorCode){
    case "ERROR_EMAIL_ALREDY_IN_USE":
    return ""

  }
}*/

bool loginVaildation(String email,String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Both fired are emty");
    return false;
  }else if(email.isEmpty){
    showMessage("email is ematy");
    return false;
    }else if (password.isEmpty){
      showMessage("password is the ematy");
      return false;
    }else {
      return true;
    }
  }

bool sigin_inVaildation(String email,String password,String name, String phone ){
  if(email.isEmpty && password.isEmpty &&name.isEmpty&&phone.isEmpty){
    showMessage("All fired are empty");
    return false;
  }else if(name.isEmpty){
    showMessage("name is ematy");
    return false;
    
    }else if(email.isEmpty){
    showMessage("email is ematy");
    return false;
    }
    else if(phone.isEmpty){
    showMessage("phone is ematy");
    return false;}
    else if (password.isEmpty){
      showMessage("password is the ematy");
      return false;
    }else {
      return true;
    }
  }
