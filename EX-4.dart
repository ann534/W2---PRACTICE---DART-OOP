enum DeliveryType { delivery, pickup }
class Product {
  String name;
  double price;
  Product({required this.name, required this.price});
}
class Order {
  int id;
  List<Product> items;
  DeliveryType deliveryType;
  Order({
    required this.id,
    required this.items,
    required this.deliveryType,
  });
  void addProduct(Product product) {
    items.add(product);
  }
  double getTotalAmount() {
    double total = 0;
    for (var product in items) {
      total += product.price;
    }
    if (deliveryType == DeliveryType.delivery) {
      total += 5.0; 
    }
    return total;
  }
}
void main() {
  var product1 = Product(name: 'Laptop', price: 1200.0);
  var product2 = Product(name: 'Mouse', price: 25.0);
  var product3 = Product(name: 'Keyboard', price: 45.0);
  var order1 = Order(
    id: 1,
    items: [product1, product2],
    deliveryType: DeliveryType.delivery,
  );

  
  var order2 = Order(
    id: 2,
    items: [product3],
    deliveryType: DeliveryType.pickup,
  );

 
  print('Order 1 total amount: \$${order1.getTotalAmount()}');
  print('Order 2 total amount: \$${order2.getTotalAmount()}');
}
