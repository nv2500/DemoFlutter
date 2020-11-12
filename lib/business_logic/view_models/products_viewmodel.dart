
import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/services/product/product_service_abs.dart';
import 'package:flutter_app/services/service_locator.dart';

class ProductsViewModel extends ChangeNotifier {
  ProductService _productService = serviceLocator<ProductService>();

  List<Product> _realBusinessProductList = List<Product>();

  List<ProductViewPresentation> _productListVP = [];

  List<ProductViewPresentation> get productList => _productListVP;
  List<ProductViewPresentation> get selectedProductList => _selectedProductListVP;

  void loadData() async {
    _realBusinessProductList = await _productService.getProducts(ProductCategory.all);
    _productListVP.clear();

    for (Product product in _realBusinessProductList) {
      ProductViewPresentation productVP = ProductViewPresentation(product.name, product.id, product.price);
      _productListVP.add(productVP);
    }
    print('? load data with size=${_productListVP.length}');
    notifyListeners();
  }

  List<ProductViewPresentation> _selectedProductListVP = [];
  void loadSelectedProducts() async {
    _selectedProductListVP.clear();
    for (ProductViewPresentation product in _productListVP) {
      if (product.quantity > 0) {
        _selectedProductListVP.add(product);
      }
    }
    print('[VM] update selected product, list size=${_selectedProductListVP?.length}');
    // notifyListeners();
  }

  void updateQuantity() async {
    // we should reload selected product in case quantity decrease to 0

    bool needReloadSelectedProduct = false;
    for (ProductViewPresentation product in _selectedProductListVP) {
      if (product.quantity == 0) {
        needReloadSelectedProduct = true;
      }
    }
    if (needReloadSelectedProduct) {
      loadSelectedProducts();
    }

    notifyListeners();
  }

}

enum ProductCategoryPresentation { all, accessories, clothing, home, }
class ProductViewPresentation {

  final ProductCategoryPresentation category;
  final int id;
  final String name;
  final double price;

  int quantity = 0;

  ProductViewPresentation(
      this.name, this.id, this.price, {this.category});
}
