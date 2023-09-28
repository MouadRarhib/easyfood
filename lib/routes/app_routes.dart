part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const CART = _Paths.CART;
  static const DETAILS = _Paths.DETAILS;
  static const PRODUCTS = _Paths.PRODUCTS;
  static const SignIn = _Paths.SignIn;
  static const NavBar = _Paths.NavBar;
  static const PERSON = _Paths.PERSON;
}

class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const DETAILS = '/details';
  static const CART = '/cart';
  static const PRODUCTS = '/products';
  static const SignIn = '/signin';
  static const NavBar = '/navbar';
  static const PERSON = '/person';
}
