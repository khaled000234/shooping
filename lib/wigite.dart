import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eco/app_provider.dart';
import 'package:flutter_eco/constance.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:provider/provider.dart';

class singlecardItem extends StatefulWidget {
   final Prodectmodal singleprodect;
  const singlecardItem({super.key,required this.singleprodect});

  @override
  State<singlecardItem> createState() => _singlecardItemState();
}

class _singlecardItemState extends State<singlecardItem> {
    int con =1;
    @override
    void initState(){
      con = widget.singleprodect.con??1;
      setState(() {
        
      });
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(12,),
                      border:Border.all(color: Colors.lightBlue,width: 1.3), 
                    ),
                  
                    child: Row(children:  [
                     Expanded(
                       child: Container(
                        height: 140,
                        color: Colors.white.withOpacity(0.5),
                        child: Image.network(widget.singleprodect.image),
                       ),
                     ),
                     Expanded(
                flex: 2,   
                  child: Container(
                  height: 140,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text(
                        widget.singleprodect.name,
                             style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold
                             ),
                      ),



Row(
 // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CupertinoButton( onPressed: (){
           setState(() {
            if(con>=1){
   con--;
            }
         
          });
         },
           child: Padding(padding: EdgeInsets.zero,
           child: const CircleAvatar( maxRadius: 11,
            child: Icon(Icons.remove),),),
         ),
         Text(con.toString(),
         style: const TextStyle(fontSize: 11,
         fontWeight: FontWeight.bold),),
         
         const SizedBox(
          width: 3,
         ),
         CupertinoButton(onPressed: (){
          setState(() {
            con++;
          });
          setState(() {
           
          });
         },
       
         padding: EdgeInsets.zero,
          child: const CircleAvatar(
            maxRadius: 11,
         child: Icon(Icons.add),),),

        ],
      ),
      
       
           Row(
             children: [
               CupertinoButton(padding: EdgeInsets.zero,
                onPressed: (){},
                child: Text("Add  ", 
                 style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold
                            )
                            ),

                          ),
                          SizedBox(width: 12,),
                          CupertinoButton(padding: EdgeInsets.zero,
                onPressed: (){
                  
 AppProvider appProvider= Provider.of<AppProvider>(context,listen:false );
 appProvider.removeCartProvider(widget.singleprodect);
 showMessage("remove");
                },
                child: CircleAvatar( maxRadius: 7,
                  child: Icon(Icons.delete),)

                          ),    
             ],
           ),
       
         
                                
                    ],
                    ),
                    
                  ),
                 
                ) ,
  
                ),
                  Text("\$${widget.singleprodect.price.toString()}", 
                   style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold)),
                    ],
                    ),
                   
                );

  }
}