const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

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
        (json[keyId] != null && double.tryParse(json[keyId].toString()) != null)
            ? int.parse(json[keyId].toString())
            : 0;

    pizza.pizzaName = (json[keyName] != null) ? json[keyName].toString() : '';

    pizza.description =
        (json[keyDescription] != null) ? json[keyDescription].toString() : '';

    pizza.price = (json[keyPrice] != null &&
            double.tryParse(json[keyPrice].toString()) != null)
        ? double.tryParse(json[keyPrice].toString())
        : 0.0;

    pizza.imageUrl = (json[keyImage] != null) ? json[keyImage].toString() : '';

    if (pizza.id == 0 || pizza.pizzaName?.trim() == '') {
      return null;
    }

    return pizza;
  }

  static Pizza fromJson(Map<String, dynamic> json) {
    // instantiate a pizza object
    Pizza pizza = Pizza();
    // use ternary operators to avoid getting null or bad values

    //id = (json['id'] != null && int.tryParse(json['id'].toString())) ?
    //int.convert(json['id'].toString()) : 0;
    pizza.id =
        (json[keyId] != null && double.tryParse(json[keyId].toString()) != null)
            ? int.parse(json[keyId].toString())
            : 0;

    pizza.pizzaName = (json[keyName] != null) ? json[keyName].toString() : '';

    pizza.description =
        (json[keyDescription] != null) ? json[keyDescription].toString() : '';

    pizza.price = (json[keyPrice] != null &&
            double.tryParse(json[keyPrice].toString()) != null)
        ? double.tryParse(json[keyPrice].toString())
        : 0.0;

    pizza.imageUrl = (json[keyImage] != null) ? json[keyImage].toString() : '';

    return pizza;
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
