class Product {
  final int id;
  final String productName;
  final String productImage;
  final int productPrice;
  final String productUsage;
  final String productDescription;
  final List<String> productIngredients;
  final List<String> productWarnings;
  final List<String> productTags;
  final String quantityPerUnit;
  final int quantity;

  Product({
    required this.id,
    required this.productPrice,
    required this.productName,
    required this.productImage,
    required this.productUsage,
    required this.productDescription,
    required this.productIngredients,
    required this.productWarnings,
    required this.productTags,
    required this.quantityPerUnit,
    required this.quantity,
  });
}
