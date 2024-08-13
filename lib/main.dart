import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/core/application_cubit/application_cubit.dart';
import 'package:shoppingcart/core/application_cubit/application_state.dart';
import 'package:shoppingcart/core/routes/app_routes.dart';
import 'package:shoppingcart/data/local/database_helper.dart';
import 'package:shoppingcart/feature/splash/splash.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationCubit>(
      create: (context) => ApplicationCubit(),
      child: BlocBuilder<ApplicationCubit, ApplicationState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            onGenerateRoute: AppRoutes.generateRoute,
            title: 'Flutter Demo',
            theme: state.themeData,
            home: const Splash(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
