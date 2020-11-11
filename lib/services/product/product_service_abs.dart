import 'package:flutter_app/business_logic/models/product.dart';

abstract class ProductService {
  Future<List<Product>> getProducts(Category category);
  Future<List<Product>> getSavedProducts();
  // Future updateSa(List<Currency> data);
}