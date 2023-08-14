import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {


  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          border: Border.all(
            color: Colors.grey,
            width: 0.25,
          ),
        ),
        child: AppBar(


          title: Text('All Products',style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
    )     // AppBar(backgroundColor: whiteColor,title: Text('All Products'),centerTitle: true,elevation: 2,shape: Border(bottom: BorderSide(width: 1,color: Colors.grey))),
    ;
  }

}