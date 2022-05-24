class Pizza {
  int? id;
  String? pizzaName;
  String? description;
  double? price;
  String? imageUrl;

  //Pizza ({required this.id, required this.pizzaName, required this.description, required this.price, required this.imageUrl});

  Pizza();

  static Pizza? fromJsonOrNull(Map<String, dynamic> json) {
    // instantiate a pizza object
    Pizza pizza = Pizza();
    // use ternary operators to avoid getting null or bad values

    //id = (json['id'] != null && int.tryParse(json['id'].toString())) ?
    //int.convert(json['id'].toString()) : 0;
    pizza.id =
        (json['id'] != null && double.tryParse(json['id'].toString()) != null)
            ? int.parse(json['id'].toString())
            : 0;

    pizza.pizzaName =
        (json['pizzaName'] != null) ? json['pizzaName'].toString() : '';

    pizza.description =
        (json['description'] != null) ? json['description'].toString() : '';

    pizza.price = (json['price'] != null &&
            double.tryParse(json['price'].toString()) != null)
        ? double.tryParse(json['price'].toString())
        : 0.0;

    pizza.imageUrl =
        (json['imageUrl'] != null) ? json['imageUrl'].toString() : '';

    if (pizza.id == 0 || pizza.pizzaName?.trim() == '') {
      return null;
    }

    return pizza;
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
