import 'dart:io';

import 'package:ecommerce_application/Admin.dart';
import 'package:ecommerce_application/Customer.dart';
import 'package:ecommerce_application/OrderManager.dart';
import 'package:ecommerce_application/Payments.dart';
import 'package:ecommerce_application/Product.dart';
import 'package:ecommerce_application/ShoppingCard.dart';

void main() {
  
  List<Product> productsInSystem = [
    Product('1', 'PC', 'Power Full PC', 25000, 5, ['pc.jpg']),
    Product('2', 'Laptop', 'Gaming Laptop', 12000, 10, ['lap.jpg']),
    Product('3', 'Mac', 'Power MAC', 30000, 4, ['mac.jpg']),
  ];

  var adminCredentials = {
    Admin('admin1', 'password123', 'me@12.com', 'Mansoura', productsInSystem),
    Admin('admin2', 'password124', 'me@13.com', 'Zagazig', productsInSystem),
  };

  var customers = [
    Customer('Mohamed', 'password123', 'me@12.com', 'Al-Sharqia'),
    Customer('Ahmed', 'password125', 'me@130.com', 'Al-Sharqia'),
  ];

  OrderManager orderManager = OrderManager();


  bool running = true;
  while (running) {
    print('Enter your username:');
    String username = stdin.readLineSync()!;
    print('Enter your password:');
    String password = stdin.readLineSync()!;

    Admin? admin;
    try {
      admin = adminCredentials.firstWhere(
          (admin) => admin.username == username && admin.password == password);
    } catch (e) {
      admin = null;
    }
    if (admin != null) {
      admin.login();
      print('\nWelcome, $username (Admin)');

      bool loggedIn = true;
      while (loggedIn) {
        print('\nSelect an action:');
        print('1. Add a new product');
        print('2. Remove a product');
        print('3. Update product price');
        print('4. Update product stock');
        print('5. Apply Discount');
        print('6. View all products');
        print('7. View all orders');
        print('8. Reset admin password');
        print('9. Logout');

        print('Enter your choice (1-9):');
        int choice = int.parse(stdin.readLineSync()!);

        switch (choice) {
          case 1:
            print('Enter ID of Product:');
            String productID = stdin.readLineSync()!;
            print('Enter Name of Product:');
            String productName = stdin.readLineSync()!;
            print('Enter Description of Product:');
            String productDescription = stdin.readLineSync()!;
            print('Enter Price of Product:');
            double priceProduct = double.parse(stdin.readLineSync()!);
            print('Enter Stock of Product:');
            int productStock = int.parse(stdin.readLineSync()!);
            print('Enter Number of Images you want to add:');
            int imagesNumber = int.parse(stdin.readLineSync()!);
            List<String> images = [];
            for (int i = 0; i < imagesNumber; i++) {
              print('Enter image ${i + 1}:');
              String element = stdin.readLineSync()!;
              images.add(element);
            }

            admin.addProduct(Product(productID, productName, productDescription,
                priceProduct, productStock, images));
            break;
          case 2:
            print('Enter Product ID you want to remove from the system:');
            String id = stdin.readLineSync()!;
            admin.removeProduct(id);
            break;
          case 3:
            print('Enter Product ID you want to update the price for:');
            String id = stdin.readLineSync()!;
            print('Enter new price of the Product:');
            double newPrice = double.parse(stdin.readLineSync()!);
            admin.updateProductPrice(id, newPrice);
            break;
          case 4:
            print('Enter Product ID you want to update the stock for:');
            String id = stdin.readLineSync()!;
            print('Enter new stock of the Product:');
            int newStock = int.parse(stdin.readLineSync()!);
            admin.updateProductStock(id, newStock);
            break;
          case 5:
            print('Enter Percentage of Discount you need to apply');
            double discount = double.parse(stdin.readLineSync()!);
            print('Enter Product ID you need to apply dicount on it');
            String id = stdin.readLineSync()!;
            admin.applyDiscount(id, discount);
            print('======= Product discount applied =======');
            break;
          case 6:
            admin.displayAllProduct();
            break;
          case 7:
            admin.viewAllOrders(orderManager.orders);
            break;
          case 8:
            print('Enter new password:');
            String newPass = stdin.readLineSync()!;
            admin.resetPassword(newPass);
            break;
          case 9:
            admin.logout();
            loggedIn = false;
            break;
          default:
            print('Invalid choice. Please enter a number between 1 and 9.');
        }
      }
    } else {
      Customer? customer;
      try {
        customer = customers.firstWhere((customer) =>
            customer.username == username && customer.password == password);
      } catch (e) {
        customer = null;
      }

      if (customer != null) {
        customer.login();
        print('\nWelcome, ${customer.username} (Customer)!');

        Customer currentUser = customer;
        ShoppingCart cart = ShoppingCart();

        bool loggedIn = true;
        while (loggedIn) {
          print('\nSelect an action:');
          print('1. View product details');
          print('2. Add product to cart');
          print('3. Remove product from cart');
          print('4. View shopping cart');
          print('5. Place order');
          print('6. View order history');
          print('7. Display customer data');
          print('8. Update address');
          print('9. Reset password');
          print('10. Logout');

          print('Enter your choice (1-10):');
          int choice = int.parse(stdin.readLineSync()!);

          switch (choice) {
            case 1:
              print('Enter ID of Product you want to display details for:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product =
                    productsInSystem.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                product.displayProductDetails();
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 2:
              print('Enter ID of Product you want to add to cart:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product =
                    productsInSystem.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                cart.addProduct(product);
                print('======= Product Added =======');
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 3:
              print('Enter ID of Product you want to remove from cart:');
              String id = stdin.readLineSync()!;
              Product? product;
              try {
                product =
                    productsInSystem.firstWhere((element) => element.id == id);
              } catch (e) {
                product = null;
              }
              if (product != null) {
                cart.removeProduct(product);
                print('======= Product Removed =======');
              } else {
                print('Product with ID $id not found');
              }
              break;
            case 4:
              cart.displayCartItems();
              break;
            case 5:
              print('Choose payment method you want to use:');
              print('1. CreditCard');
              print('2. Paypal');
              int choice = int.parse(stdin.readLineSync()!);
              var payment;
              if (choice == 1) {
                payment = CreditCard();
              } else {
                payment = PayPal();
              }
              orderManager.placeOrder(currentUser, cart, payment);
              print('======= Order Placed =======');
              break;
            case 6:
              currentUser.viewOrderHistory(orderManager.orders);
              break;
            case 7:
              currentUser.displayDetails();
              break;
            case 8:
              print('Enter new address:');
              String newAddress = stdin.readLineSync()!;
              currentUser.updateAddress(newAddress);
              print('======= Address Updated =======');
              break;
            case 9:
              print('Enter new password:');
              String newPass = stdin.readLineSync()!;
              currentUser.resetPassword(newPass);
              print('======= Password Reset =======');
              break;
            case 10:
              currentUser.logout();
              loggedIn = false;
              break;
            default:
              print('Invalid choice. Please enter a number between 1 and 10.');
          }
        }
      } else {
        print('Incorrect username or password. Please try again.');
      }
    }

    print('Do you want to exit the program? (yes/no)');
    String exitChoice = stdin.readLineSync()!;
    if (exitChoice.toLowerCase() == 'yes') {
      running = false;
    }
  }
}
