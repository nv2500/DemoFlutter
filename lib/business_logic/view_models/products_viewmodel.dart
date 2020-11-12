
import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/services/product/product_service_abs.dart';
import 'package:flutter_app/services/service_locator.dart';

class ProductsViewModel extends ChangeNotifier {
  ProductService _productService = serviceLocator<ProductService>();

  List<Product> _realBusinessProductList = List<Product>();

  List<ProductViewPresentation> _productListVP = [];

  List<ProductViewPresentation> get productList => _productListVP;
  List<ProductViewPresentation> get productsInCart => _productsInCart;

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

  List<ProductViewPresentation> _productsInCart = [];
  void loadSelectedProducts() async {
    _productsInCart.clear();
    for (ProductViewPresentation product in _productListVP) {
      if (product.quantity > 0) {
        _productsInCart.add(product);
      }
    }
    print('[VM] update selected product, list size=${_productsInCart?.length}');
    // notifyListeners();
  }

  void updateQuantity() async {
    // we should reload selected product in case quantity decrease to 0

    bool needReloadSelectedProduct = false;
    for (ProductViewPresentation product in _productsInCart) {
      if (product.quantity == 0) {
        needReloadSelectedProduct = true;
      }
    }
    if (needReloadSelectedProduct) {
      loadSelectedProducts();
    }

    notifyListeners();
  }

  double _salesTaxRate = 0.06;
  double _shippingCostPerItem = 7;
  double get subtotalCost {
    double cost = 0;
    _productsInCart?.forEach( (item) => cost += item.quantity * item.price);
    return cost;
  }

  /// Total shipping cost for the items in the cart.
  double get shippingCost {
    double cost = 0;
    _productsInCart.forEach( (item) => cost += _shippingCostPerItem);
    return cost;
  }

  /// Sales tax for the items in the cart
  double get tax => subtotalCost * _salesTaxRate;

  /// Total cost to order everything in the cart.
  double get totalCost => subtotalCost + tax + shippingCost;

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
