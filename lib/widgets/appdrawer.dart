import 'package:flutter/material.dart';
import 'package:shop_app/screens/orderscreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: const Text("MyShop"),
          automaticallyImplyLeading: false,
        ),
        SizedBox(
          height: 20,
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: Icon(Icons.shop),
          title: const Text(
            "My Products",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(OrderScreen.routeName);
          },
          leading: Icon(Icons.payment),
          title: const Text(
            "My Orders",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
      ],
    ));
  }
}
