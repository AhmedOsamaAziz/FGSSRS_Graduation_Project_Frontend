import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_flow/app/modules/home/controllers/home_controller.dart';
import 'package:premium_flow/app/modules/home/views/home_view.dart';
import 'package:premium_flow/app/modules/student/controllers/student_controller.dart';
import 'package:premium_flow/app/modules/student_manage/controllers/student_manage_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());
  // Get.put(NavigationController());
  // Get.put(StudentManageController());
  // Get.put(StudentController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Premium Flow",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // onGenerateRoute: generateRoute,
      theme: ThemeData(
          textTheme: GoogleFonts.gothicA1TextTheme(
              //Theme.of(context).textTheme,
              ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0XFF0035A8),
          )
          // secondary: KlightPallet.secondColor),
          ),
      // themeMode: ThemeMode.dark,
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // const MyApp({super.key});

//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Learning Flutter',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: GoogleFonts.mulishTextTheme(
//           Theme.of(context).textTheme,
//         ).apply(bodyColor: Colors.black),
//         primarySwatch: Colors.blue,
//         pageTransitionsTheme: const PageTransitionsTheme(builders: {
//           TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
//           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//         }),
//         primaryColor: Colors.blue,
//       ),
//       home: HomeView(),
//     );
//   }
// }
