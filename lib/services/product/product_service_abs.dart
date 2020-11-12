import 'package:flutter_app/business_logic/models/product.dart';

abstract class ProductService {
  Future<List<Product>> getProducts(ProductCategory category);
  // Future<List<Product>> getSavedProducts();
}