

import 'package:flutter/material.dart';
import 'package:restack/product_list.dart';

class CreateProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
              child: Column(
          children:<Widget>[
            //username
          Container(
            child:TextField(decoration:InputDecoration( 
              hintText:'Username')
            ,),
          ),
          //postname
          Container(child:TextField(decoration:InputDecoration( 
              hintText:'Product Name')
            ,),),
          //postdiscription
          Container(child:TextField(decoration:InputDecoration( 
              hintText:'Product Description')
            ,),),
          //post image
          Container(
            
          ),
          //post timeline
          Container(
            
          ),
          RaisedButton(
            child: Text('SUBMIT'),
            onPressed: (){
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductList()),
          );
            },)

          ],
        ),
      ),
      
    );
  }
}