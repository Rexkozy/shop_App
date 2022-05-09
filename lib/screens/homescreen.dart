import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/cartscreen.dart';
import 'package:shop_app/widgets/18601868-badge.dart';
import 'package:shop_app/widgets/appdrawer.dart';
import 'package:shop_app/widgets/product_grid.dart';

enum FavouritesOptions {
  favorites,
  all,
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productData =
        _showFavoritesOnly ? products.favoritesList : products.items;
    return Scaffold(
        appBar: AppBar(title: const Text('MyShop'), actions: [
          PopupMenuButton(
            onSelected: (FavouritesOptions selectedValue) {
              setState(() {
                if (selectedValue == FavouritesOptions.favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (ctx) => const [
              PopupMenuItem(
                child: Text("Only Favorites"),
                value: FavouritesOptions.favorites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: FavouritesOptions.all,
              )
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              color: Theme.of(context).accentColor,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
            ),
          ),
        ]),
        drawer: const AppDrawer(),
        body: ProductGrid(_showFavoritesOnly));
  }
}
