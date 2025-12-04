import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  init() async {
    var user = await userservice.getUser() ?? null;
    // code to navigate to  next screen
    Future.delayed(Duration(seconds: 3), () {
      navigationService.navigateTo(Routes.loginPage);
      user == null
          ? navigationService.navigateTo(Routes.loginPage)
          : navigationService.navigateTo(
              Routes.homeView,
              arguments: HomeViewArguments(user: user),
            );
      //navigationService.navigateTo(Routes.loginview);
      //navigationService.pushNamedAndRemoveUntil(Routes.loginview);
    });
  }
}
