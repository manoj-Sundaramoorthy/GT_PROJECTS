import 'package:amazon/product%20page.dart';
import 'package:flutter/material.dart';


class CategoryPage extends StatelessWidget {
  final String category;
  final List<dynamic> products;

  CategoryPage({required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category Products")),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          var product = products[index];
          return Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => product_page(oneProduct: product)));
                  },
                  child: Image.network(product["image"]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}