import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  final String authority = 'wj08k.mocklab.io';
  final String path = 'pizzalist';

  Future<List<Pizza>?> getPizzaList() async {
    // create url to online json, using the correct scheme/format
    Uri url = Uri.https(authority, path);

    // sent HTTP GET request, wait for results, store in variable 'result'
    http.Response result = await http.get(url);

    // if result status is ok, decode the body of the result into a list of
    // pizzas
    if (result.statusCode == HttpStatus.ok) {
      // decode body of result using json convert function from dart:convert
      final jsonResponse = json.decode(result.body);
      // provide a type argument to the map method to avoid a type error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();

      return pizzas;
    }
    return null;
  }
}
