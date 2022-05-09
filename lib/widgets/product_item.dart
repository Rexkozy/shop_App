import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) { 
    final loadedProduct = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context,listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: id,
              );
            },
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (
                context,
                value,
                child,
              ) =>
                  IconButton(
                onPressed: () {
                  loadedProduct.toggleFavoritesIcon();
                },
                icon: Icon(loadedProduct.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            title: Text(
              loadedProduct.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItemsToCart(loadedProduct.id, loadedProduct.title, loadedProduct.price);
              },
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ));
  }
}
