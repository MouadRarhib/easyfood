import 'package:easyfood/controllers/FoodController.dart';
import 'package:easyfood/controllers/ViewControllers/cartController.dart';
import 'package:easyfood/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: 'Ecommerce App',
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          initialBinding: BindingsBuilder(() {
            Get.lazyPut(() => FoodController());
            Get.lazyPut(() => CartController());
          }),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }));
}
