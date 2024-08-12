import 'package:flutter/material.dart';
import 'package:shoppingcart/gen/app_image.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImage.cart,
          width: 100,
          height: 100,
        ),
      ),
      floatingActionButton: const SizedBox(height: 100,child: Text('© 2023, QSoft. All rights reserved.',)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
