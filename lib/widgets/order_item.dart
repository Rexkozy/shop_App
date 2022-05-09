import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import "package:shop_app/providers/order.dart" as ord;
import 'package:shop_app/providers/order.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(
    this.order,
  );

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _showOrders = false;

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text("\$${widget.order.amount}"),
          subtitle: Text(
              DateFormat('dd/ MM/ yyyy hh:mm').format(widget.order.datetime)),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  _showOrders = !_showOrders;
                });
              },
              icon: Icon(_showOrders ? Icons.expand_less : Icons.expand_more)),
        ),
        if (_showOrders)
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("${prod.quantity} x \$${prod.price}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ]))
                    .toList(),
              ))
      ]),
    );
  }
}


