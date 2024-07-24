class Product {
  final String _id;
  String _name;
  String _description;
  double _price;
  int _stock;
  final List<String> _images;
  final DateTime _createAt;
  DateTime _updateAt;

  Product(this._id, this._name, this._description, this._price, this._stock,
      this._images)
      : _createAt = DateTime.now(),
        _updateAt = DateTime.now();

  String get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;
  int get stock => _stock;
  List<String> get images => _images;
  DateTime get createDate => _createAt;
  DateTime get updateDate => _updateAt;

  set price(double price) {
    _price = price;
    _updateAt = DateTime.now();
  }

  set stock(int stock) {
    _stock = stock;
    _updateAt = DateTime.now();
  }

  void displayProductDetails() {
    print('Product ID: $_id');
    print('Name: $_name');
    print('Description: $_description');
    print('Price: \$${_price.toStringAsFixed(2)}');
    print('Stock: $_stock');
    print('Images: ${_images.join(', ')}');
  }
}
