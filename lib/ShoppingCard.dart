import 'package:ecommerce_application/Product.dart';

class ShoppingCart {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    print('Added ${product.name} to the cart');
  }

  void removeProduct(Product product) {
    _products.remove(product);
    print('Removed ${product.name} from the cart');
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in _products) {
      total += product.price;
    }
    return total;
  }

  void displayCartItems() {
    print('Shopping Cart Items:');
    for (var product in _products) {
      print('${product.name} - \$${product.price.toStringAsFixed(2)}');
    }
  }
}
