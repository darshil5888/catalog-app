import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widget/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widget/home_widgets/catalog_list.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/widget/theme.dart';
import 'package:flutter_application_1/models/catalog.dart';
//import 'package:http/http.dart%20';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "darshil";

  final url="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
      // final respones =
      //   await http.get(Uri.parse(url));
        
      //   final catalogjson = respones.body;
    final decodeData = jsonDecode(catalogjson);

    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
       
  }

  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(ctx, _,VxStatus? status)=> FloatingActionButton(
          onPressed:() => Navigator.pushNamed(context,MyRoutes.cartRoute),
          // backgroundColor: MyTheme.darkBluishcolor,
          child: Icon(CupertinoIcons.cart,color:Colors.white,),
        ).badge(color:Vx.red500,size: 22,count: _cart.items.length,textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(), // Removed .expand() here
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py16() // Added padding for spacing
                else
                  CircularProgressIndicator().centered(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
