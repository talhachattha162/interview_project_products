import 'dart:convert';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>?> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Product.mapToProduct(item)).toList();
    } else {
      print(response.body);
      return null;
    }
  }
}