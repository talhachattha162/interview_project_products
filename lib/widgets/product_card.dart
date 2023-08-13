import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.38,
      width: width,
      child: Column(children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(

decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black12),borderRadius: BorderRadius.all(Radius.circular(5))),


              child: SizedBox(
                width: width,
                height: height * 0.25,
                child: FadeInImage(fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                  ),
                  placeholder: NetworkImage(
                    'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00000000AED',
                    style: TextStyle(
                      color: blackShade,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: height * 0.01),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Golden Shirt',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: productFontSize),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
                maxLines: 2,

                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
