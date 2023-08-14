import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:interview_project/providers/product_details_provider.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';



class ProductDetailsScreen extends StatelessWidget {
  
  final Product product;
  const ProductDetailsScreen({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [PopupMenuButton(itemBuilder: (context) {
          return [const PopupMenuItem(child: Text('Delete'))];
        },)]),
        body:  Stack(

          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SizedBox(
                      width: width,
                      height: height*0.5,
                      child: FadeInImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          product.image,
                        ),
                        placeholder: NetworkImage(
                          product.image,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                      child: Container(
                          color: Colors.black.withOpacity(0.6),child: const Text('Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: headingFontSize))),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child:    Container(
                      color: Colors.black.withOpacity(0.6), // Semi-transparent overlay color
                      child: Text('${product.price}AED',style: const TextStyle(fontSize: headingFontSize,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ],
            ),

            Stack(
            alignment: Alignment.bottomLeft,
            children: [

               Selector<ProductDetailsProvider,double>(
                 selector: (p0, p1) => p1.containerHeight,
                 builder: (context, containerHeight, child) =>  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0, // Set right to 0 to stretch the container across the screen
                    child: Container(
                    height: height * containerHeight,
                    decoration:  BoxDecoration(
                      color: containerHeight==0.37?navsColor:Colors.blueGrey,
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () {
                                    if(containerHeight==0.37){
                                      Provider.of<ProductDetailsProvider>(context,listen: false).containerHeight=0.6;
                                    }
                                    else{
                                      Provider.of<ProductDetailsProvider>(context,listen: false).containerHeight=0.37;
                                    }
                                  }, icon: Icon(containerHeight==0.37?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,color: tealLight,)),
                                ],
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            ElevatedButton(

                              onPressed: () {

                            }, child: const Icon(Icons.file_upload_outlined,color: tealLight),),
                            ElevatedButton(
                                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(tealLight)),
                                onPressed: () {

                            }, child: SizedBox(width: width*0.6,height: height*0.06,child: const Center(child: Text('Order Now',style: TextStyle(color: whiteColor),))))
                          ],),
                          const Text('Description',style: TextStyle(fontStyle: FontStyle.italic),),
                              Text(
                                product.description,
                                maxLines: containerHeight==0.37?7:9,
                                overflow: TextOverflow.ellipsis,
                              ),
Visibility(
  visible: containerHeight!=0.37?true:false,
  child:   Card(child: Column(children: [
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Reviews(${product.rating.count})'),
        ],
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(product.rating.rate.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      SizedBox(
            // color: Colors.black.withOpacity(0.6), // Semi-transparent overlay color

            width: 100,
        height: height * 0.03,
        child:
        RatingBar.builder(
          initialRating: product.rating.rate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20.0,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {

          },
        )

      ),

    ],)
  ]),),
)
                        ]),
                      ),
                    ),
              ),
               ),
            ],
      ),
          ],
        ),


    ),
    );
  }
}
