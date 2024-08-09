import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/product_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  // List<ProductModel> product = [];
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: Text("Deatil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network("${product!.image}")
            Center(
              child: CachedNetworkImage(
                imageUrl: "${product!.image}",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: CircularProgressIndicator()),
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width - 200,
                      child: Text(
                        "${product!.title}",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      )),
                  Text(
                    "\$${product!.price}",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rating",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("${product!.rate!.rate}"),
            SizedBox(
              height: 10,
            ),
            Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("${product!.description}"),
            Text("${product!.title}"),
            Spacer(),
            InkWell(
              onTap: () {
                print(product!.title.toString());
                providerR!.saveData(
                    product!.title.toString(),
                    product!.price.toString(),
                    product!.category.toString(),
                    product!.image.toString(),
                );
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.center,
                decoration: BoxDecoration( color: Colors.orange.shade200,borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
