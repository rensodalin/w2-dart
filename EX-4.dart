enum Deliver { DELIVERED, PICKED_UP }

class Customer {
  final String name;
  int? age;
  String address;

  Customer({required this.name, this.age, required this.address});
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class OrderItem {
  Product product;
  int quantity;

  OrderItem({required this.product, required this.quantity});
}

class Order {
  final Customer customer;
  double deliveryFee;
  List<OrderItem> orderedItems;
  Deliver deliveryType;

  Order.delivered({required this.customer, required this.deliveryFee})
    : deliveryType = Deliver.DELIVERED,
      orderedItems = [];
  Order.pickedUp({required this.customer})
    : deliveryType = Deliver.PICKED_UP,
      deliveryFee = 0,
      orderedItems = [];

  void addOrderItem(Product product, int quantity) {
    orderedItems.add(OrderItem(product: product, quantity: quantity));
  }

  void totalPrice() {
    double total = 0;
    for (OrderItem item in orderedItems) {
      total += item.product.price * item.quantity;
    }
    if (deliveryType == Deliver.DELIVERED) total += deliveryFee;
    print('Total price: \$${total}');
  }
}

void main() {
  var customer = Customer(name: 'Menghan', address: 'Phnom Penh', age: 20);
  var laptop = Product(name: 'Laptop', price: 500.0);
  var keyboard = Product(name: 'Keyboard', price: 20.0);
  var mouse = Product(name: 'Mouse', price: 5.0);

  print('Delivery order: ');
  var orderDelivered = Order.delivered(customer: customer, deliveryFee: 2.0);
  orderDelivered.addOrderItem(laptop, 1);
  orderDelivered.addOrderItem(keyboard, 1);
  orderDelivered.addOrderItem(mouse, 1);
  orderDelivered.totalPrice();

  print('Pick up order: ');
  var orderPickedUp = Order.pickedUp(customer: customer);
  orderPickedUp.addOrderItem(laptop, 2);
  orderPickedUp.addOrderItem(keyboard, 1);
  orderPickedUp.addOrderItem(mouse, 1);
  orderPickedUp.totalPrice();
}
