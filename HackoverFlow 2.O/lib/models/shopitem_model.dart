class ShopItems {
  final String id;
  final int price;
  final String pet;
  final String type;
  final String name;
  final String url;
  final bool available;
  final String desc;
  ShopItems(
      {
        required this.id,
      required this.pet,
      required this.url,
      required this.available,
        required this.type,
        required this.desc,
        required this.name,
      required this.price});
}
