enum DeliveryType { DELIVERY , PICKUP }

class Product { 
  final String name ;
  final double price ;

  const Product ( {required this.name ,  required this.price} );

  @override
  String toString() => '$name: \$$price.toStringAsFixed(2)' ;
}

class OrderItem {
  final Product product; 
  final int quantity ;

  OrderItem( { required this.product , required this.quantity});

  double getTotal() => product.price * quantity ;

  @override
  String toString() => '${product.name} x $quantity: \$${getTotal().toStringAsFixed(2)}' ;

}

class Order {
  final int id;
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final String? address;

  const Order({
    required this.id,
    required this.items,
    required this.deliveryType,
    this.address,
  });

  double getTotalAmount () {
    double total = 0 ;
    for (var item in items) {
      total += item.getTotal() ;
    }
    if(deliveryType == DeliveryType.DELIVERY) {
      total += 5.0 ; 
    }
    return total ;
  }
  @override
  String toString() {
    String itemDetails = items.map((item) => item.toString()).join(', ');
    String deliveryInfo = deliveryType == DeliveryType.DELIVERY
        ? 'Delivery to $address'
        : 'Pickup';
    return 'Order #$id: [$itemDetails], $deliveryInfo, Total: \$${getTotalAmount().toStringAsFixed(2)}';
  }
}

void main () {
  final p1 = Product(name: 'Coffee', price: 3.5);
  final p2 = Product(name: 'Cake', price: 4.0);
  final p3 = Product(name: 'Sandwich', price: 5.5);

  // Sample orders
  final order1 = Order(
    id: 1,
    items: [
      OrderItem(product: p1, quantity: 2),
      OrderItem(product: p2, quantity: 1),
    ],
    deliveryType: DeliveryType.DELIVERY,
    address: 'Phnom Penh, Cambodia',
  );

  final order2 = Order(
    id: 2,
    items: [OrderItem(product: p3, quantity: 3)],
    deliveryType: DeliveryType.PICKUP,
  );

  // Test output
  print(order1);
  print(order2);
}
