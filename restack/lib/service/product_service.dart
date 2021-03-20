import 'dart:convert';

import 'package:restack/models/api_response.dart';
import 'package:restack/models/product_listing_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const API = "";
  Future<APIResponse<List<ProductForListing>>> getProductList() {
    return http.get(API + '/post').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final products = <ProductForListing>[];
        for (var item in jsonData) {
          final product = ProductForListing(
            post_id: item['post_id'],
            username: item['username'],
            product_image: item['product_image'],
            product_name: item['product_name'],
            product_description: item['product_description'],
            timeline_from_date: item['timeline_from_date'] != null
                ? DateTime.parse(item['timeline_from_date'])
                : null,
            timeline_to_date: item['timeline_to_date'] != null
                ? DateTime.parse(item['timeline_to_date'])
                : null,
          );
          products.add(product);
        }
        return APIResponse<List<ProductForListing>>(
          data: products,
        );
      }
      return APIResponse<List<ProductForListing>>(
          error: true, errormessage: 'An error occured');
    }).catchError((_) => APIResponse<List<ProductForListing>>(
        error: true, errormessage: 'An error occured'));
  }
}
