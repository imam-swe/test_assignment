import 'dart:convert';

import 'package:flutter/material.dart';

class OrderSubmitScreen extends StatefulWidget {
  const OrderSubmitScreen({Key? key}) : super(key: key);

  @override
  _OrderSubmitScreenState createState() => _OrderSubmitScreenState();
}

class _OrderSubmitScreenState extends State<OrderSubmitScreen> {
  String shopName = '';
  String phoneNumber = '';
  List<Item> items = [];

  void addItem(String name, int quantity) {
    setState(() {
      if (items.length < 10) {
        items.add(Item(name: name, quantity: quantity));
      } else {
        // Show error message for exceeding max items
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('You cannot add more than 10 items.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void submitOrder() {
    if (shopName.isEmpty || phoneNumber.isEmpty || items.isEmpty) {
      // Show error message for missing fields
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill all the required fields and add items.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    Order order = Order(shopName: shopName, phoneNumber: phoneNumber, items: items);
    String json = jsonEncode(order);

    // Navigate to new screen or display raw JSON
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Order Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(json),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Submit')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Shop Name'),
                onChanged: (value) {
                  setState(() {
                    shopName = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(items[index].name),
                trailing: Text('${items[index].quantity}'),
              ),
            ),
            ElevatedButton(
              onPressed: () => submitOrder(),
              child: const Text('Submit Order'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItemDialog(BuildContext context) {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: itemNameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (itemNameController.text.isNotEmpty && quantityController.text.isNotEmpty) {
                  addItem(itemNameController.text, int.parse(quantityController.text));
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class Item {
  String name;
  int quantity;

  Item({required this.name, required this.quantity});
}

class Order {
  String shopName;
  String phoneNumber;
  List<Item> items;

  Order({required this.shopName, required this.phoneNumber, required this.items});

  Map<String, dynamic> toJson() {
    return {
      'shopName': shopName,
      'phoneNumber': phoneNumber,
      'items': items.map((item) => {'name': item.name, 'quantity': item.quantity}).toList(),
    };
  }
}
