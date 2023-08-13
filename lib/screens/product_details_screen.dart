import 'package:flutter/material.dart';
import 'package:interview_project/utils/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double heigh=0.36;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [PopupMenuButton(itemBuilder: (context) {
          return [PopupMenuItem(child: Text('Delete'))];
        },)]),
        body:  Stack(

          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  width: width,
                  height: height*0.52,
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                    ),
                    placeholder: NetworkImage(
                      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: Text('1000AED',style: TextStyle(fontSize: headingFontSize,fontWeight: FontWeight.bold,color: blackShade),),
                ),
              ],
            ),

            Stack(
            alignment: Alignment.bottomLeft,
            children: [

               Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0, // Set right to 0 to stretch the container across the screen
                  child: Container(
                  height: height * heigh,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
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
                                  if(heigh==0.36){
                                    setState(() {
                                      heigh=0.5;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      heigh=0.36;
                                    });
                                  }
                                }, icon: Icon(heigh==0.36?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,color: tealLight,)),
                              ],
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          ElevatedButton(

                            onPressed: () {

                          }, child: Icon(Icons.file_upload_outlined,color: tealLight),),
                          ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(tealLight)),
                              onPressed: () {

                          }, child: SizedBox(width: width*0.5,height: height*0.06,child: Center(child: Text('Order Now',style: TextStyle(color: whiteColor),))))
                        ],),
                        Text('Description',style: TextStyle(fontStyle: FontStyle.italic),),
                            Text(
                              'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
                              maxLines: 10,

                              overflow: TextOverflow.ellipsis,
                            ),
Visibility(
  visible: heigh!=0.36?true:false,
  child:   Card(child: Column(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Reviews(100)'),
        ],
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('4.33'),
      SizedBox(
        width: 120,
        height: height * 0.05,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star_outlined,
              color: goldenColor,
            );
          },
        ),
      ),

    ],)
  ]),),
)
                      ]),
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
