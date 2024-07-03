import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<CartItem> cartItems = [
    CartItem("Mini Garden Sculpture", 450.00, 1, "BLACK"),
    CartItem("Table Desk Lamp Light", 140.00, 1, "BLACK"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          TotalWidget(total: calculateTotal()),
          CheckoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement your cart functionality here
          print("Cart button pressed");
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;
  final String color;

  CartItem(this.name, this.price, this.quantity, this.color);
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  CartItemWidget({required this.item, required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.color),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => onQuantityChanged(item.quantity - 1),
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => onQuantityChanged(item.quantity + 1),
          ),
          Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

class TotalWidget extends StatelessWidget {
  final double total;

  TotalWidget({required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('\$${total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('CHECKOUT CART'),
      onPressed: () {
        // Implement checkout functionality
        print("Checkout button pressed");
      },
    );
  }
}