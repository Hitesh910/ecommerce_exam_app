import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/product_model.dart';
class APIHelper
{
  Future<List<ProductModel>?> getProduct()
  async{
    String link = "https://fakestoreapi.com/products?_gl=1*j6guq9*_ga*MjAwMTk4NTgwMy4xNzIzMDA4NzM1*_ga_ZCYG64C7PL*MTcyMzE3NzgxMC4zLjEuMTcyMzE3NzgxNC4wLjAuMA..";

    var response =await http.get(Uri.parse(link));

    if(response.statusCode == 200)
      {
        List json = jsonDecode(response.body);
        List<ProductModel> product = json.map((e) => ProductModel.mapToModel(e),).toList() ?? [];
        return product;
      }
    return null;
  }
}