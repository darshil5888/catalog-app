import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
   
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // _cart.catalog = _catalog;
          // _cart.catalog = CatalogModel();
          // _cart.add(catalog);
           AddMutation( catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            context.theme.floatingActionButtonTheme.backgroundColor),
        shape: WidgetStateProperty.all(const StadiumBorder()),
      ),
      child:
          isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus, color: Colors.white,),
    );
  }
}
