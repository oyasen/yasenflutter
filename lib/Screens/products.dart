import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasen_osama_0522020_s4/Providers/login_provider.dart';
import 'package:yasen_osama_0522020_s4/Providers/products_provider.dart';
import 'package:yasen_osama_0522020_s4/Screens/product_details.dart';
import 'package:yasen_osama_0522020_s4/Widgets/custom_product.dart';

class Products extends StatelessWidget {
  const Products({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("Products"),
        centerTitle: true,
          leading: Text(""),
      ),
      body: Consumer<ProductsProvider>(builder:(context, value, child) {
        var products = value.model?.products;
        if(products == null)
          {
            value.fetch();
            return const Center(child: CircularProgressIndicator(),);
          }
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, crossAxisCount: 2, mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(name: products.elementAt(index)["name"], description: products.elementAt(index)["description"], img: products.elementAt(index)["image"]),));
            },
            child: CustomProduct(
                name: products.elementAt(index)["name"],
                price: products.elementAt(index)["price"].toString(),
                img: products.elementAt(index)["image"]
            ),
          );
        },
      );
      },
      ),
    );
  }
}
