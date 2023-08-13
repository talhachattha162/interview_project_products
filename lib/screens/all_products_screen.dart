import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_project/screens/product_details_screen.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:interview_project/widgets/product_card.dart';

import '../widgets/custom_appbar.dart';

class AllProductsScreen extends StatelessWidget {
   AllProductsScreen({super.key});

  List products=['','',''];

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height;
    final width=MediaQuery.sizeOf(context).width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor is used to set Status bar color in Android devices.
      statusBarColor: tealDark,

      // To make Status bar icons color white in Android devices.
      statusBarIconBrightness: Brightness.light,

      // statusBarBrightness is used to set Status bar icon color in iOS.
      statusBarBrightness: Brightness.light,
      // Here light means dark icon color for Status bar.
    ));
    return SafeArea(
      child:Container(
        color: Colors.red[300],
        child: Scaffold(
          appBar:
CustomAppBar(),
          body:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
          child: SizedBox(
            height:height*0.9 ,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
              return InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(),));
              },
                child: Column(
                  children: [
                    ProductCard(),
                   index==(products.length-1)? Container():Divider(),
                   index==(products.length-1)? Container():SizedBox(height: height*0.02,)
                  ],
                ),
              );
            },),
          ),
        )
        )
      ),
    );
  }
}
