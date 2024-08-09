import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  Future<void> setTitle(List<String> title)
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    shr.setStringList("title", title);
  }

  Future<List<String>> getTitle()
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
   List<String>? title =  shr.getStringList("title")??[];
    return title;
  }

  Future<void> setPrice(List<String> price)
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    shr.setStringList("price", price);
  }

  Future<List<String>> getPrice()
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    List<String> price =  shr.getStringList("price")??[];
    return price;
  }

  Future<void> setCategory(List<String> category)
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    shr.setStringList("category", category);
  }

  Future<List<String>> getCategory()
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    List<String> category =  shr.getStringList("category")??[];
    return category;
  }

  Future<void> setImage(List<String> image)
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    shr.setStringList("image", image);
  }

  Future<List<String>> getImage()
  async {
    SharedPreferences shr =await SharedPreferences.getInstance();
    List<String> image =  shr.getStringList("image")??[];
    return image;
  }
}