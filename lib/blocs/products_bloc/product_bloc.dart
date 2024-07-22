import 'package:bloc/bloc.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_events.dart';
import 'package:lesson1_dio/blocs/products_bloc/product_state.dart';
import 'package:lesson1_dio/data/repositories/products_repository.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final ProductsRepository _productsRepository;

  ProductBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(InitialProductState() as ProductState) {
    on<GetProductsEvent>(_getProducts);
  }

  void _getProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(LoadingProductState() as ProductState);
    try {
      final response = await _productsRepository.getProducts();
      emit(LoadedProductState(response) as ProductState);
    } catch (e) {
      emit(ErrorProductsState(e.toString()));
    }
  }
}
