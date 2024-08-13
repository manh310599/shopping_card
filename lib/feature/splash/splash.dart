import 'package:flutter/material.dart';
import 'package:shoppingcart/gen/app_image.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImage.cart,
          width: 100,
          height: 100,
        ),
      ),
      floatingActionButton: const SizedBox(
        height: 100,
        child: Text('© 2023, QSoft. All rights reserved.'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
