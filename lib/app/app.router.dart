// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:my_mvvm/models/User.dart' as _i6;
import 'package:my_mvvm/ui/screens/homescreen/home_view.dart' as _i4;
import 'package:my_mvvm/ui/screens/login/login_view.dart' as _i3;
import 'package:my_mvvm/ui/screens/splash/splashview.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const splashview = '/';

  static const loginPage = '/login-page';

  static const homeView = '/home-view';

  static const all = <String>{splashview, loginPage, homeView};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.splashview, page: _i2.Splashview),
    _i1.RouteDef(Routes.loginPage, page: _i3.LoginPage),
    _i1.RouteDef(Routes.homeView, page: _i4.HomeView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Splashview: (data) {
      final args = data.getArgs<SplashviewArguments>(
        orElse: () => const SplashviewArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.Splashview(key: args.key),
        settings: data,
      );
    },
    _i3.LoginPage: (data) {
      final args = data.getArgs<LoginPageArguments>(
        orElse: () => const LoginPageArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginPage(key: args.key),
        settings: data,
      );
    },
    _i4.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.HomeView(key: args.key, user: args.user),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SplashviewArguments {
  const SplashviewArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SplashviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class LoginPageArguments {
  const LoginPageArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginPageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeViewArguments {
  const HomeViewArguments({this.key, this.user});

  final _i5.Key? key;

  final _i6.User? user;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToSplashview({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginPage({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.loginPage,
      arguments: LoginPageArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    _i5.Key? key,
    _i6.User? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key, user: user),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSplashview({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithLoginPage({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.loginPage,
      arguments: LoginPageArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i5.Key? key,
    _i6.User? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key, user: user),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
