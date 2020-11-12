

import 'package:flutter_app/business_logic/models/product.dart';
import 'package:flutter_app/services/webapi/web_api_abs.dart';

class WebApiImpl implements WebApi {

  List<Product> _productsCached;

  @override
  Future<List<Product>> fetchProducts() async {
    if (_productsCached == null) {
      //final uri = Uri.https(_host, _path);
      //final results = await http.get(uri, headers: _headers);
      //final jsonObject = json.decode(results.body);
      //_productsCached = _createRateListFromRawMap(jsonObject);
      // TODO: implement fetchProducts via web call api, parse data then cache it
      _productsCached = [];
    } else {
      _productsCached = [];
    }

    return _productsCached;
  }

}