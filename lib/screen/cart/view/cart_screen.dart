import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: providerW!.title.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image(image: NetworkImage("${providerR!.image[index]}"),width: 50,height: 50,),
                    Column(
                      children: [
                        Text("${providerR!.title[index]}"),
                        Text("${providerR!.category[index]}"),
                      ],
                    ),
                    Text("${providerR!.price[index]}"),
                  ],
                ),
              ),
              // Image(image: NetworkImage("${providerR!.image[index].toString()}"))
            ],
          );
        },
      ),
    );
  }
}
