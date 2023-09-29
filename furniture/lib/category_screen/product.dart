class Product {
  final String id;
  final String name;
  final String price; // You can change the data type as needed
  // Add other fields as needed

  Product({
    required this.id,
    required this.name,
    required this.price,
    required isApproved, required category,
    // required category, required subcategory, required image,
    // Initialize other fields here
  });

  get isApproved => null;
}
