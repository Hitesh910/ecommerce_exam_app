import 'package:ecommerce_app/utils/api_helper.dart';
import 'package:ecommerce_app/utils/helper/shared_helper.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
class HomeProvider with ChangeNotifier
{
  Future<List<ProductModel>?>? product;
  List<ProductModel> cartList = [];
  List title = [];
  List price = [];
  List category = [];
  List<String> image = [];
  String? select = "All";
  SharedHelper helper = SharedHelper();
  List<String> categoryList = [
    "All","men's clothing","jewelery","electronics","women's  clothing"
  ];

  Future<void> getProduct()
  async {
    APIHelper helper = APIHelper();
    product = helper.getProduct();

    product!.then((value) {
      if(product != null)
        {
          notifyListeners();
        }
    },);
    

    // if(i != null)
    //   {
    //
    //   }
    // notifyListeners();
  }

  Future<void> saveData(String? title,String? price,String? category,String? image)
  async {
    List<String> data1 = [];
    List<String> data2 =[];
    List<String> data3 = [];
    List<String> data4 = [];
    data1.add(title!);
    data2.add(price!);
    data3.add(category!);
    data4.add(image!);
    // print(title);
    helper.setTitle(data1);
    helper.setPrice(data2);
    helper.setCategory(data3);
    helper.setImage(data4);
    notifyListeners();
  }

  Future<void> getData()
  async {
    var data1 =await helper.getTitle();
     var data2 = await helper.getPrice();
     var data3 = await helper.getCategory();
     List<String> data4 = await helper.getImage();

    if(data1 != null && data2 != null && data3 != null && data4 != null) {
      title.add(data1);
      price.add(data2);
      category.add(data3);
      image.add(data4 as String);
      // title.add(data1 as String);
    }
    notifyListeners();
    // cartList.add();
  }

  void categoryL(String name)
  {
    select = name;
    notifyListeners();
  }

  void deleteData(int index)
  {
    title.removeAt(index);
    price.removeAt(index);
    category.removeAt(index);
    image.removeAt(index);
    getData();
  }
}