import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExpansionTile(
            title: Text("MakeUp"),
            leading: Icon(Icons.shopping_cart),
            children: [
              ListTile(
                title: Text("Foundation"),
              ),
              ListTile(
                title: Text("Eyeliner"),
              ),
              ListTile(
                title: Text("Lipstic"),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Dress"),
            leading: Icon(Icons.shopping_cart),
            children: [
              ListTile(
                title: Text("Men"),
              ),
              ListTile(
                title: Text("Weman"),
              ),
              ListTile(
                title: Text("Kids"),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Shoe"),
            leading: Icon(Icons.shopping_cart),
            children: [
              ListTile(
                title: Text("Foundation"),
              ),
              ListTile(
                title: Text("Eyeliner"),
              ),
              ListTile(
                title: Text("Lipstic"),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Bag"),
            leading: Icon(Icons.shopping_cart),
            children: [
              ListTile(
                title: Text("Men"),
              ),
              ListTile(
                title: Text("Weman"),
              ),
              ListTile(
                title: Text("Kids"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
