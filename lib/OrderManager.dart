import 'dart:math';
import 'package:ecommerce_application/Customer.dart';
import 'package:ecommerce_application/Order.dart';
import 'package:ecommerce_application/Payments.dart';
import 'package:ecommerce_application/ShoppingCard.dart';

class OrderManager {
  final List<Order> _orders = [];

  void placeOrder(
      Customer customer, ShoppingCart cart, PaymentMethod paymentMethod) {
    String orderId = 'ORD${Random().nextInt(1000)}';
    double totalAmount = cart.calculateTotal();
    DateTime orderDate = DateTime.now();
    Order order = Order(orderId, customer, List.from(cart.products),
        totalAmount, 'Pending', orderDate);
    _orders.add(order);
    cart.products.clear();
    paymentMethod.pay(totalAmount);
    print('Order placed successfully');
  }

  List<Order> get orders => _orders;
}
