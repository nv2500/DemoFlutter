import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter_app/services/product/product_service_abs.dart';
import 'package:flutter_app/services/webapi/web_api_abs.dart';

import 'package:flutter_app/services/service_locator.dart';

class ProductServiceImpl implements ProductService {

  WebApi _webApi = serviceLocator<WebApi>();

  @override
  Future<List<Product>> getProducts(ProductCategory category) async {
    List<Product> productsData = await _webApi.fetchProducts();

    // filter product list base on the input of category
    if (category == ProductCategory.all) {
      return productsData;
    } else {
      return productsData.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }


}