import 'package:flutter/material.dart';
import 'package:interview_project/utils/constants.dart';

Container navBar(BuildContext context) {
  return Container(
    height: 60,
      decoration:const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.black38),
        ),
      color: Colors.white54,

  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        enableFeedback: true,
        onPressed: () {

        },
        icon:

        const Icon(
          Icons.home_filled,
          color: tealLight,
          size: 35,
        ),
      ),
      IconButton(
        enableFeedback: true,
        onPressed: () {

        },
        icon:

        const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
          size: 35,
        ),
      ),
      IconButton(
        enableFeedback: true,
        onPressed: () {

        },
        icon:
        const Icon(
          Icons.favorite_border_outlined,
          color: Colors.black,
          size: 35,
        ),
      ),
      IconButton(
        enableFeedback: true,
        onPressed: () {
        },
        icon:

        const Icon(
          Icons.person_outline,
          color: Colors.black,
          size: 35,
        ),
      ),
    ],
  )
          );
}
