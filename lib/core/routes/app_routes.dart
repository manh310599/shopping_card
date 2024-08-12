import 'package:flutter/material.dart';
import 'package:shoppingcart/feature/home/home.dart';
import 'package:shoppingcart/feature/splash/splash.dart';

class RouteArguments<T> {
  final T? item;
  final VoidCallback? callback;

  RouteArguments({this.item, this.callback});
}


class AppRoutes {

  static const String splash = '/';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      // case '/product':
      //   final args = settings.arguments as RouteArguments<Product>;
      //   return MaterialPageRoute(builder: (_) => ProductPage(product: args.item, callback: args.callback));
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
        },);
    }
  }

  static final AppRoutes _instance = AppRoutes._internal();

  factory AppRoutes() {
    return _instance;
  }

  AppRoutes._internal();

}