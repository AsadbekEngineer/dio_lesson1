import 'package:lesson1_dio/data/models/product_model.dart';
import 'package:lesson1_dio/data/services/dio_product_services.dart';

class ProductsRepository {
  final DioProductServices _dioProductServices;

  ProductsRepository({required DioProductServices dioProductServices})
      : _dioProductServices = dioProductServices;

  Future<List<Product>> getProducts() async {
    return await _dioProductServices.getProducts();
  }
}
