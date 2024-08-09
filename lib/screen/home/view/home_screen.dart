import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: const Text("Shopy"),
      ),
      body: FutureBuilder(
          future: providerW!.product,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.hasError}");
            } else if (snapshot.hasData) {
              List<ProductModel> product = [];
              product = snapshot.data!;

              if (product.isEmpty) {
                return const Text("No data found");
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          providerW!.categoryListHome.length,
                          (index) {
                            return InkWell(
                              onTap: () {
                                String select = providerW!.categoryListHome[index];
                                providerW!.categoryL(select);
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                margin: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.orange.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Text(
                                    "${providerR!.categoryListHome[index]}"),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Products",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: product.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/detail',
                                    arguments: product[index]);
                              },
                              child: providerW!.select ==
                                      product[index].category
                                  ? Container(
                                      height: MediaQuery.sizeOf(context).height,
                                      width: MediaQuery.sizeOf(context).width,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Container(width: 100,height: 100,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${providerR!.product![index].image}"))),)
                                              Center(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${product[index].image}",
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width -
                                                                300,
                                                        child: Text(
                                                          "${product[index].title}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Text(
                                                        "\$${product[index].price}")
                                                  ],
                                                ),
                                              ),
                                              Text("${product[index].category}")
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : providerW!.select == "All"
                                      ? Container(
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Container(width: 100,height: 100,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${providerR!.product![index].image}"))),)
                                                  Center(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          "${product[index].image}",
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width -
                                                                300,
                                                            child: Text(
                                                              "${product[index].title}",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          18),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                        Text(
                                                            "\$${product[index].price}")
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                      "${product[index].category}")
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container());
                        },
                      ),
                    ),
                  ],
                );
              }
            }

            return const Center(child: CircularProgressIndicator());
          }),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                title: const Text("Cart"),
                trailing: const Icon(Icons.shopping_bag),
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width - 100,
                  child: const Divider(
                    thickness: 1,
                  ))
            ],
          ),
        ),
      ),
      // Column(
      //   children: [
      //     // Expanded(
      //     //   child: ListView.builder(
      //     //     itemCount: providerW!.product!.length,
      //     //     itemBuilder: (context, index) {
      //     //     return  Text("${providerR!.product![index].rate!.rate}");
      //     //     },
      //     //   ),
      //     )
      //   ],
      // ),
    );
  }
}
