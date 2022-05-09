import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/order.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartscreen';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  label: Text(
                    '\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                    onPressed: () {
                      order.addOrderItems(
                          cart.items.values.toList(), cart.totalPrice);
                      cart.clear();
                    },
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (context, i) => CartItem(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].title,
                      )))
        ],
      ),
    );
  }
}
