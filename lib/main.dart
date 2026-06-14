import 'package:dio/dio.dart';
import 'package:e_commerce/cache/cache_helper.dart';
import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/cubit/products_cubit.dart';
import 'package:e_commerce/feature/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          ProductsCubit(ProductsRepo(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: SplashPage(),
    );
  }
}
