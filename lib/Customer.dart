import 'package:ecommerce_application/Order.dart';
import 'package:ecommerce_application/User.dart';

class Customer extends User {
  Customer(super._username, super._password, super._email, super._address);

  void updateAddress(String newAddress) {
    setAddress = newAddress;
    print('Address updated to $newAddress');
  }

  void viewOrderHistory(List<Order> orders) {
    print('Order History for $username:');
    for (var order in orders) {
      if (order.customer == this) {
        order.displayOrderDetails();
      }
    }
  }

  @override
  void resetPassword(String newPassword) {
    if (_validatePassword(newPassword)) {
      setPassword = newPassword;
      print('Password for $username has been reset');
    } else {
      print(
          'Password reset failed. Password does not meet the required criteria.');
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
}
