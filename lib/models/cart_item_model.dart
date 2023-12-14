class CartItem {
  final int id;
  final String name;
  final String image;
  final String nameSize;
  late int amount;
  final int price;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.nameSize,
    required this.amount,
    required this.price,
  });
}
