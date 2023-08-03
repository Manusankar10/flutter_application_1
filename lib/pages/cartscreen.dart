import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Map<String, int> addedItems;

  const CartScreen({required this.addedItems, Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: const Color.fromARGB(255, 153, 23, 176),
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.addedItems.length,
        itemBuilder: (context, index) {
          final productName = widget.addedItems.keys.toList()[index];
          final productQuantity = widget.addedItems.values.toList()[index];

          return ListTile(
            title: Text(productName),
            subtitle: Text('Quantity: $productQuantity'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    _reduceItemQuantity(productName);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _removeItem(productName);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _reduceItemQuantity(String productName) {
    setState(() {
      if (widget.addedItems.containsKey(productName)) {
        if (widget.addedItems[productName]! > 1) {
          widget.addedItems[productName] = widget.addedItems[productName]! - 1;
        } else {
          _removeItem(productName);
        }
      }
    });
  }

  void _removeItem(String productName) {
    setState(() {
      widget.addedItems.remove(productName);
    });
  }
}
