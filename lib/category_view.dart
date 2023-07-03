import 'package:flutter/material.dart';
import 'package:flutter_eco/category_model.dart';
import 'package:flutter_eco/firebase_firestore.dart';
import 'package:flutter_eco/prodect_detail.dart';
import 'package:flutter_eco/prodect_modal.dart';
import 'package:flutter_eco/rowes.dart';
//import 'package:flutter_eco/top_title.dart';


class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
 
    List<Prodectmodal>ProdectmodalList=[];

  bool isLoading = false;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    ProdectmodalList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    ProdectmodalList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                  
                    ),
                  ),
                  // Padding(
                    // padding: const EdgeInsets.all(8.0),
                  //  child: top_title(subtitle: "", title: widget.categoryModel.name),
                 //  ),
                //  const SizedBox(height: kToolbarHeight*1),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const BackButton(),
                        Text(
                          widget.categoryModel.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProdectmodalList.isEmpty
                      ? const Center(
                          child: Text("Best Product is empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: ProdectmodalList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.7,
                                      crossAxisCount: 2),
                              itemBuilder: (ctx, index) {
                                Prodectmodal singleProduct =
                                    ProdectmodalList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Image.network(
                                        singleProduct.image,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("Price: \$${singleProduct.price}"),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 140,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Routes.instance.push(
                                                widget: Prodect_Details( singleprodect:
                                                  
                                                   singleProduct),
                                                context: context);
                                          },
                                          child: const Text(
                                            "Buy",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
    );
  }
}
