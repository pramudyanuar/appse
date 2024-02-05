import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/addcourse/bindings/addcourse_binding.dart';
import '../modules/addcourse/views/addcourse_view.dart';
import '../modules/addnews/bindings/addnews_binding.dart';
import '../modules/addnews/views/addnews_view.dart';
import '../modules/addtraining/bindings/addtraining_binding.dart';
import '../modules/addtraining/views/addtraining_view.dart';
import '../modules/adminpanel/bindings/adminpanel_binding.dart';
import '../modules/adminpanel/views/adminpanel_view.dart';
import '../modules/changepass/bindings/changepass_binding.dart';
import '../modules/changepass/views/changepass_view.dart';
import '../modules/editprofile/bindings/editprofile_binding.dart';
import '../modules/editprofile/views/editprofile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/material/bindings/material_binding.dart';
import '../modules/material/views/material_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/training/bindings/training_binding.dart';
import '../modules/training/views/training_view.dart';
import '../modules/usermanagement/bindings/usermanagement_binding.dart';
import '../modules/usermanagement/views/usermanagement_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditprofileView(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASS,
      page: () => ChangepassView(),
      binding: ChangepassBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.TRAINING,
      page: () => TrainingView(),
      binding: TrainingBinding(),
    ),
    GetPage(
      name: _Paths.MATERIAL,
      page: () => MaterialView(),
      binding: MaterialBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.ADMINPANEL,
      page: () => const AdminpanelView(),
      binding: AdminpanelBinding(),
    ),
    GetPage(
      name: _Paths.USERMANAGEMENT,
      page: () => const UsermanagementView(),
      binding: UsermanagementBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWS,
      page: () => const AddnewsView(),
      binding: AddnewsBinding(),
    ),
    GetPage(
      name: _Paths.ADDCOURSE,
      page: () => const AddcourseView(),
      binding: AddcourseBinding(),
    ),
    GetPage(
      name: _Paths.ADDTRAINING,
      page: () => const AddtrainingView(),
      binding: AddtrainingBinding(),
    ),
  ];
}
