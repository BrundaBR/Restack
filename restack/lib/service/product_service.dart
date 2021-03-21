import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:restack/models/api_response.dart';
import 'package:restack/models/product_listing_model.dart';
import 'package:http/http.dart' as http;

//after signup

  // LocalStorage storage = LocalStorage("usertoken");
  // Future<bool> registerNow(String username, String password) async {
  //   try {
  //     String url = 'http://10.0.2.2:8000/signup/';
  //     http.Response response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: json.encode({
  //         'username': username,
  //         'password': password,
  //       }),
  //     );
  //     var data = json.decode(response.body) as Map;
  //     print(data);
  //     return data['error'];
  //   } catch (e) {
  //     print('error');
  //     return e;
  //   }
  // }


class ProductService {
  static const API = "http://127.0.0.1:8000/";

  Future<APIResponse<List<ProductForListing>>> getProductList() {
    return http.get(API + 'post/?format=json').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
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
