import 'package:dio/dio.dart';
import 'package:lesson1_dio/core/networks/dio_client.dart';
import 'package:lesson1_dio/data/models/product_model.dart';

class DioProductServices{
  final _dioClient = DioClient();

  Future<List<Product>> getProducts()async{
    try{
      final response = await _dioClient.get(url: "/products");
      List<Product> products = [];

      for(var product in response.data){
        product.add(Product.fromMap(product));
      }

      return products;
    }on DioException catch(e){
      rethrow;
    }
    catch(e){
      rethrow;
    }
  }
}