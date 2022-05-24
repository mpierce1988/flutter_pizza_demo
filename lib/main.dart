import 'dart:convert';
import 'package:store_data/pizza.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder(
        future: readJsonFile(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
          return ListView.builder(
            itemCount: pizzas.data == null ? 0 : pizzas.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: pizzas.data == null
                    ? const Text('Default Text')
                    : Text(pizzas.data![position].pizzaName!),
                subtitle: Text(pizzas.data![position].description! +
                    ' - ' +
                    pizzas.data![position].price.toString()),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    // save json as a string
    String myString = await DefaultAssetBundle.of(context)
        .loadString("assets/pizzalist.json");
    // decode json string into a list of key:value pairs
    List myMap = jsonDecode(myString);
    // create empty list of pizzas
    List<Pizza> myPizzas = [];
    // loop through pizza entries in myMap, decode each entry into a pizza
    // object and add to myPizzas list
    //myMap.forEach((dynamic pizza) {});

    for (dynamic pizza in myMap) {
      Pizza myPizza = Pizza.fromJsonOrNull(pizza)!;
      myPizzas.add(myPizza);
    }

    //String json = convertToJson(myPizzas);
    //print(json);

    return myPizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    String json = '[';

    //pizzas.forEach((pizza) => {json += jsonEncode(pizza)});

    for (dynamic pizza in pizzas) {
      json += jsonEncode(pizza);
    }

    json += ']';

    return json;
  }
}
