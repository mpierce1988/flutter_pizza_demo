class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imageUrl;

  //Pizza ({required this.id, required this.pizzaName, required this.description, required this.price, required this.imageUrl});

  Pizza.fromJson(Map<String, dynamic> json) {
    // use ternary operators to avoid getting null or bad values

    //id = (json['id'] != null && int.tryParse(json['id'].toString())) ?
    //int.convert(json['id'].toString()) : 0;
    id = (json['id'] != null && double.tryParse(json['id'].toString()) == true)
        ? int.parse(json['id'])
        : 0;

    pizzaName = (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';

    description =
        (json['description'] != null) ? json['description'].toString() : '';

    price = (json['price'] != null &&
            double.tryParse(json['price'].toString()) != null)
        ? double.tryParse(json['price'].toString())
        : 0.0;

    imageUrl = (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
