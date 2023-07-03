//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/category_model.dart';
import 'package:flutter_eco/category_view.dart';
import 'package:flutter_eco/firebase_firestore.dart';
import 'package:flutter_eco/prodect_detail.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/rowes.dart';
import 'package:flutter_eco/top_title.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel>categoriesList=[];
  List<Prodectmodal>ProdectmodalList=[];
bool isLoading=false;
  @override
  void initState(){
    AppProvider appProvider= Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfoFirebase();
    getCategories();
    super.initState();
  }
  void getCategories() async{
    setState(() {
      isLoading =true;
    });
categoriesList= await FirebaseFirestoreHelper.instance.getCategories();
ProdectmodalList= await FirebaseFirestoreHelper.instance.getbestProdect();

ProdectmodalList.shuffle();
  setState(() {
      isLoading =false;
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? Center(
        child: Container(height: 100,width: 100,alignment: Alignment.center,
        child: CircularProgressIndicator(),),
      ): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(padding: const EdgeInsets.all(12.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const top_title(subtitle: "fjjfjf", title: "Ecommect",),
            TextFormField(decoration: const InputDecoration(hintText:"Search..."),
            ),const SizedBox(height: 8,),
      const Text("categories",
         style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
         
         ),
          ],
      
         ),
         
         ),
         const Padding(padding: EdgeInsets.all(8),
         
         ),
         categoriesList.isEmpty?Center(child: Text("catagry is emty"),)
         :SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Row(
            children: categoriesList.map((e) => Padding(padding: 
            const EdgeInsets.only(left: 8.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                Routes.instance.push(widget: CategoryView(categoryModel: e), context: context);
              },
              child: Card(
                color: Colors.white,
                elevation: 13.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: SizedBox(height: 100,width: 100,child:Image.network(e.image),
                ),
              ),
            ),
           
            ),
            ).toList(),
           ),
         ),
       
         Padding(
           padding: const EdgeInsets.only(top: 12,left: 12),
           child: const Text("Best prodect ",
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold
           ),
           
           ),
         ),
         ProdectmodalList.isEmpty?Center(child: Text("prodect is EMPTY"),)
         :
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: GridView.builder(
            padding: const EdgeInsets.only(bottom: 50),
            shrinkWrap: true,
            itemCount: ProdectmodalList.length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20 ,
              crossAxisSpacing: 20,
           childAspectRatio: 0.7,
            crossAxisCount: 2),
               
            itemBuilder:(ctx,Index){
              Prodectmodal singleprodect = ProdectmodalList[Index];
              return Container(
                decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Image.network(singleprodect.image,height: 130 ,width: 130,),
                    SizedBox(height: 12,),
                    Text(
                      singleprodect.name,
           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold
           ),
                    ),
                    Text("price \$${singleprodect.price}"),
                    const SizedBox(height: 12,),
                    SizedBox(height: 45,
                    width: 140,
                      child: OutlinedButton(onPressed: (){
                        Routes.instance.push(widget: Prodect_Details(singleprodect: singleprodect), context: context);
                      },
                      
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        surfaceTintColor: Colors.red,
                        shadowColor: Colors.blueGrey,
                        side: BorderSide(color: Colors.lightBlue,width: 1.6)),
                       child:const Text("Buy")))
                  ],
                ),
              );
            }),
         ),
         const SizedBox(height: 12,)
        ],
        ),
      ),
    );
  }
}

/*List<Prodectmodal>bestProdect=[
 Prodectmodal(id: "1", name: "one piece", price: "140", decoration: "fghdjsafdfdjksjfldkfljkdldkjfs", Status: "ddmdmdm",
 
  isFavourite: false, image: "https://uploads.turbologo.com/uploads/design/hq_preview_image/4551835/draw_svg20211224-8647-1vc0v11.svg.png"),


Prodectmodal(
id: "1", name: "one piece", price: "140", decoration: "fghdjsafdfdjksjfldkfljkdldkjfs", Status: "ddmdmdm",
 
  isFavourite: false, image: "https://uploads.turbologo.com/uploads/design/hq_preview_image/4551835/draw_svg20211224-8647-1vc0v11.svg.png"),
  
Prodectmodal(
id: "1", name: "one piece", price: "140", decoration: "fghdjsafdfdjksjfldkfljkdldkjfs", Status: "ddmdmdm",
 
  isFavourite: false, image: "https://uploads.turbologo.com/uploads/design/hq_preview_image/4551835/draw_svg20211224-8647-1vc0v11.svg.png"),
  
Prodectmodal(
id: "1", name: "one piece", price: "140", decoration: "fghdjsafdfdjksjfldkfljkdldkjfs", Status: "ddmdmdm",
 
  isFavourite: false, image: "https://uploads.turbologo.com/uploads/design/hq_preview_image/4551835/draw_svg20211224-8647-1vc0v11.svg.png"),

];*/