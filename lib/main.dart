import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_bloc.dart';
import 'package:lesson1_dio/data/repositories/products_repository.dart';
import 'package:lesson1_dio/data/services/dio_product_services.dart';
import 'package:lesson1_dio/views/screens/products_screen.dart';

void main() {
  final dioProductServices = DioProductServices();
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            return ProductsRepository(dioProductServices: dioProductServices);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ProductBloc(
                productsRepository: context.read<ProductsRepository>(),
              );
            },
          ),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsScreen(),
    );
  }
}
