import 'dart:convert';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/utils/themes.dart';
import 'package:catalog_app/widgets/Home_widgets/CatalogHeader.dart';
import 'package:catalog_app/widgets/Home_widgets/Catalog_list.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    Catalogmodels.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.CartRoute);
        },
        backgroundColor: MyTheme.lightblueish,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if (Catalogmodels.items != null && Catalogmodels.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
    );
  }
}

//Without velocity x
// Scaffold(
// appBar: AppBar(
// title: Text(
// 'Catalog App',
// style: TextStyle(color: Colors.black),
// ),
// ),,
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: (Catalogmodels.items != null && Catalogmodels.items.isNotEmpty)
// // ? ListView.builder(
// //     itemCount: Catalogmodels.items.length,
// //     itemBuilder: (context, index) => ItemWidget(
// //       item: Catalogmodels.items[index],
// //     ),
// //   )
// ? GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2),
// itemBuilder: (context, index) {
// final item = Catalogmodels.items[index];
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15)),
// child: GridTile(
// header: Container(
// child: Text(
// item.name,
// style: TextStyle(color: Colors.white),
// ),
// padding: EdgeInsets.all(12),
// decoration: BoxDecoration(color: Colors.deepPurple),
// ),
// child: Image.network(item.image),
// footer: Container(
// child: Text(
// item.price.toString(),
// style: TextStyle(color: Colors.white),
// ),
// padding: EdgeInsets.all(12),
// decoration: BoxDecoration(color: Colors.black),
// ),
// ),
// );
// },
// itemCount: Catalogmodels.items.length,
// )
// : Center(
// child: CircularProgressIndicator(),
// ),
// ),
// drawer: Drawer(
// child: MyDrawer(),
// ),
// );
