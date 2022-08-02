import 'package:dio/dio.dart';

import 'package:education_app/model/product_model.dart';

Future<List<Cart>?> getCart() async {
  const String url = 'https://dummyjson.com/carts';
  final Response response = await Dio(BaseOptions()).get(url);
  if (response.statusCode == 200 || response.statusCode == 201) {
    final cartList = (response.data['carts'] as List).map((e) {
      return Cart.fromJson(e);
    }).toList();

    return cartList;
  }
}
