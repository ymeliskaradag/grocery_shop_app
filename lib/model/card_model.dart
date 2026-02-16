import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Water ", "1.00", "lib/images/water.png", Colors.blue],
  ];

  //list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(String name) {
    int shopIndex = _shopItems.indexWhere((item) => item[0] == name);

    if (shopIndex != -1) {
      var item = _shopItems[shopIndex];
      int cartIndex = _cartItems.indexWhere((element) => element[0] == name);

      if (cartIndex >= 0) {
        if (_cartItems[cartIndex].length <= 4) {
          _cartItems[cartIndex].add(2);
        } else {
          _cartItems[cartIndex][4] = (_cartItems[cartIndex][4] ?? 1) + 1;
        }
      } else {
        List newItem = List.from(item);
        newItem.add(1);
        _cartItems.add(newItem);
      }

      notifyListeners();
    }
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners(); //for updates
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      double price = double.parse(_cartItems[i][1]);

      int quantity = 1;
      if (_cartItems[i].length > 4) {
        quantity = _cartItems[i][4] ?? 1;
      }

      totalPrice += (price * quantity);
    }
    return totalPrice.toStringAsFixed(2);
  }
}