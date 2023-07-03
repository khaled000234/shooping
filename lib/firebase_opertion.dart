import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfing{
  static FirebaseOptions get platformOptions{
    if(Platform.isAndroid){
      return const FirebaseOptions(
        apiKey:"AIzaSyBLw-pG-c_etm87nSG0c_3-gKsRk0mW7es" , 
      appId: "1:216401001242:android:cd3d09f364ee1e7caa8aa3",
       
        projectId: 'e-com-e378e',
        messagingSenderId: "216401001242"
        );
    }else {
      return const FirebaseOptions(apiKey:'AIzaSyBLw-pG-c_etm87nSG0c_3-gKsRk0mW7es'  , 
      appId:'1:216401001242:android:cd3d09f364ee1e7caa8aa3',
       messagingSenderId: 'e-com-e378e', 
       projectId:'216401001242');
    }

  }
}