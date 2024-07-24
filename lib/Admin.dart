import 'package:ecommerce_application/Order.dart';
import 'package:ecommerce_application/User.dart';
import 'package:ecommerce_application/Product.dart';

class Admin extends User {
  List<Product> productList = [];

  Admin(super._username, super._password, super._email, super._address,
      this.productList);

  void addProduct(Product product) {
    productList.add(product);
    print('===============================');
    print('Product ${product.name} added');
    print('===============================');
  }

  void removeProduct(String productId) {
    var productToRemove =
        productList.firstWhere((product) => product.id == productId);
    productList.remove(productToRemove);
    print('===============================');
    print('Product ${productToRemove.name} removed');
    print('===============================');
  }

  void updateProductPrice(String productId, double newPrice) {
    var productToUpdate =
        productList.firstWhere((product) => product.id == productId);
    productToUpdate.price = newPrice;
    print('===============================');
    print(
        'Product ${productToUpdate.name} price updated to \$${newPrice.toStringAsFixed(2)}');
    print('===============================');
  }

  void updateProductStock(String productId, int newStock) {
    var productToUpdate =
        productList.firstWhere((product) => product.id == productId);
    productToUpdate.stock = newStock;
    print('===============================');
    print('Product ${productToUpdate.name} stock updated to $newStock');
    print('===============================');
  }

  void applyDiscount(String productId, double discountPercentage) {
    if (discountPercentage > 0 && discountPercentage <= 100) {
      var priceToUpdate =
          productList.firstWhere((product) => product.id == productId);
      priceToUpdate.price -= priceToUpdate.price * (discountPercentage / 100);
    } else {
      print('===============================');
      print('Invalid discount percentage');
      print('===============================');
    }
  }

  void viewAllOrders(List<Order> orders) {
    print('All Orders:');
    print('===============================');
    for (var order in orders) {
      order.displayOrderDetails();
    }
  }

  @override
  void resetPassword(String newPassword) {
    if (_validatePassword(newPassword)) {
      setPassword = newPassword;
      print('===============================');
      print('Password for $username has been reset');
      print('===============================');
    } else {
      print('============================================');
      print(
          'Password reset failed. Password does not meet the required criteria.');
        print('==========================================');
    }
  }

  bool _validatePassword(String password) {
    if (password.length < 8) {
      return false;
    }
    bool hasLetter = password.contains(RegExp(r'[A-Za-z]'));
    bool hasDigit = password.contains(RegExp(r'\d'));
    return hasDigit && hasLetter;
  }

  void displayAllProduct() {
    print('===============================');
    for (var product in productList) {
      product.displayProductDetails();
      print('==========================');
    }
  }
}
