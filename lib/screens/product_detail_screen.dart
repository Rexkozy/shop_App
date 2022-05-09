import 'dart:core';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/productsDetails";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context).findbyId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProducts.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('\$${loadedProducts.price}'),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(loadedProducts.description),
            )
          ],
        ),
      ),
    );
  }
}
