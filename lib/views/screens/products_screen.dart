import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_bloc.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_events.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_state.dart';
import 'package:lesson1_dio/data/models/product_model.dart';
import 'package:lesson1_dio/views/screens/add_user.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade600,
        centerTitle: true,
        title: const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is LoadingProductState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorProductsState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            List<Product> products = [];
            if (state is LoadedProductState) {
              products = state.products;
            }
            return products.isEmpty
                ? const Center(
                    child: Text("Productlar mavjud emas!!!"),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final pro = products[index];
                      print(products[index].images);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              pro.images.isNotEmpty ? pro.images[0] : ''),
                        ),
                        title: Text(pro.category.toString()),
                        subtitle: Text(
                          pro.description,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 22,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Delete action here
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber.shade700,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddUser();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
