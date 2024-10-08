import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CataTotal(),
        ],
      ),
    );
  }
}

class _CataTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
  final CartModel _cart=(VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
       VxConsumer(
            builder: (context, _, __) {
              return "\$${_cart.totalprice}"
                  .text
                  .xl5
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
            mutations: {RemoveMutation},
            notifications:{},
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  context.theme.floatingActionButtonTheme.backgroundColor),
              shape: WidgetStateProperty.all(const StadiumBorder()),
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}



class _CartList extends StatelessWidget {
    final CartModel _cart=(VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final items = _cart.items ;
    return items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed:(){
                 RemoveMutation(_cart.items[index]);
                  // setState(() {
                    
                  // });
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
