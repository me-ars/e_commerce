import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppNavigation/AppNavigation.dart';
import 'model/CartModel.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartmodel(),
      child: MaterialApp.router(
        title: 'Go Router Example',
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}