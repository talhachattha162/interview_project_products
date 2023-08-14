import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_project/providers/all_products_provider.dart';
import 'package:interview_project/providers/product_details_provider.dart';
import 'package:interview_project/repositories/product_repo.dart';
import 'package:interview_project/screens/product_details_screen.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:interview_project/widgets/navbar.dart';
import 'package:interview_project/widgets/product_card.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../widgets/custom_appbar.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {

  final ProductRepository _productRepository = ProductRepository();
  bool isLoading=true;
  final int itemsPerPage = 7;
  int startIndex = 0;
  int endIndex = 0;
  List<Product> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchAllProducts();
    });
  }

  Future<void> _fetchAllProducts() async {
    List<Product>? products ;
    try {
      products = await _productRepository.fetchProducts();
    } catch (error) {
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error loading data')));
    }
    startIndex = 0;
    endIndex = 7;
    displayedProducts = products!.sublist(startIndex,
        endIndex < products.length ? endIndex : products.length);
    isLoading = false;
    Provider.of<AllProductsProvider>(context, listen: false).allProducts=products;

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: tealLight,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: navBar(context),
          appBar: const CustomAppBar(),
          body: Consumer<AllProductsProvider>(
            builder: (context, allProductsProvider, child) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: displayedProducts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider<ProductDetailsProvider>(
                                                  create:(context) => ProductDetailsProvider(),
                                                  child:  ProductDetailsScreen(
                                                      product: displayedProducts[
                                                      index]),

                                                ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          ProductCard(
                                              product:
                                                  displayedProducts[index]),
                                          index == displayedProducts.length - 1
                                              ? Container()
                                              : const Divider(),
                                        ],
                                      ),
                                    ),
                                    index == displayedProducts.length - 1
                                        ? Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              Wrap(
                                                children: List.generate(
                                                  (allProductsProvider.allProducts.length / itemsPerPage).ceil(),
                                                      (pageIndex) => InkWell(
                                                    onTap: (pageIndex + 1) ==
                                                        allProductsProvider.currentPagePagination
                                                        ? null
                                                        : () {
                                                      startIndex = (pageIndex) * itemsPerPage;
                                                      endIndex = startIndex + itemsPerPage;
                                                      displayedProducts = allProductsProvider.allProducts.sublist(
                                                        startIndex,
                                                        endIndex < allProductsProvider.allProducts.length
                                                            ? endIndex
                                                            : allProductsProvider.allProducts.length,
                                                      );
                                                      Provider.of<AllProductsProvider>(
                                                        context,
                                                        listen: false,
                                                      ).currentPagePagination = pageIndex + 1;
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: (pageIndex + 1) ==
                                                              allProductsProvider.currentPagePagination
                                                              ? tealDark
                                                              : Colors.transparent,
                                                          border: Border.all(width: 1, color: Colors.grey),
                                                        ),
                                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                                        child: Text((pageIndex + 1).toString()), // Incremented by 1
                                                      ),
                                                    ),
                                                  ),
                                                ),


                                              )
                                            ],
                                          )
                                        : Container()
                                  ],
                                );
                              },
                            ),
                          ),
                          // Pagination Controls
                        ],
                      ),
                    );
            },
          )),
    );
  }
}
