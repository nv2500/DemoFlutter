import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter_app/services/product/product_service_abs.dart';

class ProductServiceImpl implements ProductService {
  @override
  Future<List<Product>> getProducts(Category category) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSavedProducts() {
    // TODO: implement getSavedProducts
    throw UnimplementedError();
  }

  @override
  Future updateSa(List<dynamic> data) {
    // TODO: implement updateSa
    throw UnimplementedError();
  }

}