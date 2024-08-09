class ProductModel {
  int? id;
  String? title, description,image,category;
  num? price;
  RateModel? rate;

  ProductModel({this.id, this.title, this.description, this.rate,this.image,this.price,this.category});

  factory ProductModel.mapToModel(Map m1) {
    return ProductModel(
        id: m1['id'],
        title: m1['title'],
        description: m1['description'],
        image: m1['image'],
        price: m1['price'],
        category: m1['category'],
        rate: RateModel.mapToModel(m1['rating']));
  }
}

class RateModel {
  num? rate;
  num? count;

  RateModel({this.rate, this.count});

  factory RateModel.mapToModel(Map m1) {
    return RateModel(rate: m1['rate'], count: m1['count']);
  }
}
