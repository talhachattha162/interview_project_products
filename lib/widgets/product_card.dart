import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product.dart';
import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
   Product product;
   ProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.40,
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
                    product.image,
                  ),
                  placeholder: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
    Container(
    color: Colors.black.withOpacity(0.5), // Semi-transparent overlay color

                    child: Text(
                      product.price.toString()+'AED',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                  // color: Colors.black.withOpacity(0.5), // Semi-transparent overlay color

    width: 100,
                    height: height * 0.03,
                    child:
                    RatingBar.builder(
                      unratedColor: Colors.blueGrey,
                      initialRating: product.rating.rate,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )

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
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: height * 0.01),
              Text(
                product.description,
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
