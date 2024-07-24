abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using Credit Card');
  }
}

class PayPal extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using PayPal');
  }
}
