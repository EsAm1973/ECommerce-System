abstract class User {
  String _username;
  String _password;
  String _address;
  String _email;

  User(this._username, this._password, this._email, this._address);

  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get address => _address;

  set setPassword(String newPassword) {
    _password = newPassword;
  }

  set setAddress(String newAddress) {
    _address = newAddress;
  }

  void login() {
    print('\n$_username logged in');
  }

  void logout() {
    print('\n$_username logged out');
  }

  void displayDetails() {
    print('Username: $_username');
    print('Password: $_password');
    print('Address: $_address');
    print('Email: $_email');
  }

  void resetPassword(String newPassword);
}
