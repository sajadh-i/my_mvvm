import 'package:my_mvvm/services/db_service.dart';
import 'package:my_mvvm/ui/screens/homescreen/home_view.dart';
import 'package:my_mvvm/ui/screens/login/login_view.dart';
import 'package:my_mvvm/ui/screens/splash/splashview.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_services.dart';
import '../services/user_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: DbService),
  ],
)
class AppSetUp {}
