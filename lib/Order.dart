import 'package:ecommerce_application/Customer.dart';
import 'package:ecommerce_application/Product.dart';

class Order {
  final String _id;
  final Customer _customer;
  final List<Product> _products;
  double _totalAmount;
  String _status;
  final DateTime _orderDate;

  Order(this._id, this._customer, this._products, this._totalAmount,
      this._status, this._orderDate);

  String get id => _id;
  Customer get customer => _customer;
  List<Product> get products => _products;
  double get totalAmount => _totalAmount;
  String get status => _status;
  DateTime get orderDate => _orderDate;

  void displayOrderDetails() {
    print('Order ID: $_id');
    print('Customer: ${_customer.username}');
    print('Order Date: $_orderDate');
    print('Status: $_status');
    print('Total Amount: \$${_totalAmount.toStringAsFixed(2)}');
    print('Products:');
    for (var product in _products) {
      print('${product.name} - \$${product.price.toStringAsFixed(2)}');
    }
  }
}
