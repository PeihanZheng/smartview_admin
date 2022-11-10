import 'package:get/get.dart';
import 'package:smartview_admin/pages/add_camera_module/add_camera_page.dart';
import 'package:smartview_admin/pages/dashboard_module/dashboard_page.dart';
import 'pages/splash.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/dashboard', page: () => Dashboard()),
    GetPage(name: '/add-camera', page: () => AddCameraPage()),
  ];
}
