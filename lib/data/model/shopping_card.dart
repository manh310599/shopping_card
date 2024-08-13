import 'package:shoppingcart/data/model/product.dart';
import 'package:shoppingcart/gen/app_image.dart';

class ShoppingCard {
  final int? id;
  final Product product;
  final int quantity;

  ShoppingCard({
     this.id,
    required this.product,
    required this.quantity,
  });

  factory ShoppingCard.fromJson(Map<String, dynamic> json) {
    return ShoppingCard(
      id: json['id'],
      product: Product(
        id: json['productId'].toString(),
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
      ),
      quantity: json['quantity'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'productId': product.id,
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'image': product.image,
      'quantity': quantity,
    };
  }


  copyWith({
    int? id,
    Product? product,
    int? quantity,
  }) {
    return ShoppingCard(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

final shoppingCardDemo = [
  ShoppingCard(
    id: 1,
    product: Product(
      id: '1',
      name: 'Product 1',
      description: 'Description 1',
      price: 100,
      image: AppImage.product_0,
      hot: true,
    ),
    quantity: 1,
  ),
  ShoppingCard(
    id: 2,
    product: Product(
      id: '2',
      name: 'Product 2',
      description: 'Description 2',
      price: 200,
      image: AppImage.product_1,
      hot: false,
    ),
    quantity: 2,
  ),
  ShoppingCard(
    id: 3,
    product: Product(
      id: '3',
      name: 'Product 3',
      description: 'Description 3',
      price: 300,
      image: AppImage.product_2,
      hot: true,
    ),
    quantity: 3,
  ),
  ShoppingCard(
    id: 4,
    product: Product(
      id: '4',
      name: 'Product 4',
      description: 'Description 4',
      price: 400,
      image: AppImage.product_3,
      hot: false,
    ),
    quantity: 4,
  ),
  ShoppingCard(
    id: 5,
    product: Product(
      id: '5',
      name: 'Product 5',
      description: 'Description 5',
      price: 500,
      image: AppImage.product_4,
      hot: true,
    ),
    quantity: 5,
  ),
  ShoppingCard(
    id: 6,
    product: Product(
      id: '6',
      name: 'Product 6',
      description: 'Description 6',
      price: 600,
      image: AppImage.product_5,
      hot: false,
    ),
    quantity: 6,
  ),

];