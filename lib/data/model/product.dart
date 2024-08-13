import 'package:shoppingcart/gen/app_image.dart';

class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final bool? hot;

  Product( {this.id,this.name, this.description, this.price, this.image, this.hot});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      hot: json['hot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'hot': hot,
    };
  }
}

List<Product> products = [
  Product(
    id: '1',
    name: 'Product 0',
    description: 'Description 0',
    price: 100,
    image: AppImage.product_0,
    hot: true,
  ),
  Product(
    id: '2',
    name: 'Product 1',
    description: 'Description 1',
    price: 200,
    image: AppImage.product_1,
    hot: false,
  ),
  Product(
    id: '3',
    name: 'Product 2',
    description: 'Description 2',
    price: 300,
    image: AppImage.product_2,
    hot: true,
  ),
  Product(
    id: '4',
    name: 'Product 3',
    description: 'Description 3',
    price: 400,
    image: AppImage.product_3,
    hot: false,
  ),
  Product(
    id: '5',
    name: 'Product 4',
    description: 'Description 4',
    price: 500,
    image: AppImage.product_4,
    hot: true,
  ),
  Product(
    id: '6',
    name: 'Product 5',
    description: 'Description 5',
    price: 600,
    image: AppImage.product_5,
    hot: false,
  ),
  Product(
    id: '7',
    name: 'Product 6',
    description: 'Description 6',
    price: 700,
    image: AppImage.product_6,
    hot: true,
  ),
  Product(
    id: '8',
    name: 'Product 7',
    description: 'Description 7',
    price: 800,
    image: AppImage.product_7,
    hot: false,
  ),
  Product(
    id: '9',
    name: 'Product 8',
    description: 'Description 8',
    price: 900,
    image: AppImage.product_8,
    hot: true,
  ),
  Product(
    id: '10',
    name: 'Product 9',
    description: 'Description 9',
    price: 1000,
    image: AppImage.product_9,
    hot: false,
  ),
];
