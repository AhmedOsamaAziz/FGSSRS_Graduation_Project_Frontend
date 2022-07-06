import 'package:get/get.dart';

import '../modules/employee/bindings/employee_binding.dart';
import '../modules/employee/views/employee_view.dart';
import '../modules/employee_manage/bindings/employee_manage_binding.dart';
import '../modules/employee_manage/views/employee_manage_view.dart';
import '../modules/flow/bindings/flow_binding.dart';
import '../modules/flow/views/flow_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/postpone_course/bindings/postpone_course_binding.dart';
import '../modules/postpone_course/views/postpone_course_view.dart';
import '../modules/student/bindings/student_binding.dart';
import '../modules/student/views/student_view.dart';
import '../modules/student_manage/bindings/student_manage_binding.dart';
import '../modules/student_manage/views/student_manage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT,
      page: () => const StudentView(),
      binding: StudentBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE,
      page: () => const EmployeeView(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_MANAGE,
      page: () => const StudentManageView(),
      binding: StudentManageBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_MANAGE,
      page: () => const EmployeeManageView(),
      binding: EmployeeManageBinding(),
    ),
    GetPage(
      name: _Paths.FLOW,
      page: () => const FlowView(),
      binding: FlowBinding(),
    ),
    GetPage(
      name: _Paths.POSTPONE_COURSE,
      page: () => const PostponeCourseView(),
      binding: PostponeCourseBinding(),
    ),
  ];
}
