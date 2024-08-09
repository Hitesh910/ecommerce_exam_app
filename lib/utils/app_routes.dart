import 'package:ecommerce_app/screen/cart/view/cart_screen.dart';
import 'package:ecommerce_app/screen/detail/view/detail_screen.dart';
import 'package:ecommerce_app/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screen/home/view/home_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => SplashScreen(),
  "/home":(context) => HomeScreen(),
  "/detail":(context) => DetailScreen(),
  "/cart":(context) => CartScreen(),
};