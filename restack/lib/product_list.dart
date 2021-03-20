import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restack/detail_view.dart';
import 'package:restack/global.dart';
import 'package:restack/main.dart';
import 'package:restack/models/api_response.dart';
import 'package:restack/models/product_listing_model.dart';
import 'package:restack/product_add_Form.dart';
import 'package:restack/service/product_service.dart';

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key:key);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductService get service => GetIt.I<ProductService>();
  APIResponse<List<ProductForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
   
    super.initState();
     _fetchProducts();
  }

  _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getProductList();
    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restack"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateProduct()),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return CircularProgressIndicator();
            }
            if (_apiResponse?.error) {
              return Center(
                child: Text(_apiResponse.errormessage),
              );
            }
            return ListView.separated(
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: darkgreen,
              ),
              itemBuilder: (_, index) {
                return Container(
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: darkgreen,
                    ),
                    title: Text(
                      _apiResponse.data[index].product_name,
                    ),
                    subtitle: Text(''),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProductView()),
                      );
                    },
                  ),
                );
              },
              itemCount: _apiResponse.data.length,
            );
          },
        ));
  }
}
