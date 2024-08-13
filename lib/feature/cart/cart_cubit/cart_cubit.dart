import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/data/model/shopping_card.dart';
import 'package:shoppingcart/feature/cart/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  init() {
    emit(CartLoaded(products: shoppingCardDemo, total: 0));
  }
}
