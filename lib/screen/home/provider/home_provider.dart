import 'package:ecommerce_app/utils/api_helper.dart';
import 'package:ecommerce_app/utils/helper/shared_helper.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
class HomeProvider with ChangeNotifier
{
  Future<List<ProductModel>?>? product;
  List<ProductModel> cartList = [];
  List<String> titleList = [];
  List<String> priceList = [];
  List<String> categoryList = [];
  List<String> imageList = [];
  String? select = "All";
  SharedHelper helper = SharedHelper();
  List<String> categoryListHome = [
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
    titleList.add(title!);
     priceList.add(price!);
     categoryList.add(category!);
     imageList.add(image!);
    // print(title);
    helper.setTitle(titleList);
    helper.setPrice(priceList);
    helper.setCategory(categoryList);
    helper.setImage(imageList);
    notifyListeners();
  }

  Future<void> getData()
  async {
    var data1 =await helper.getTitle();
     var data2 = await helper.getPrice();
     var data3 = await helper.getCategory();
     List<String> data4 = await helper.getImage();

    if(data1 != null && data2 != null && data3 != null && data4 != null) {
      titleList = data1;
      priceList = data2;
      categoryList = data3;
      imageList = data4;
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
    titleList.removeAt(index);
    priceList.removeAt(index);
    categoryList.removeAt(index);
    imageList.removeAt(index);
    getData();
    notifyListeners();
  }
}