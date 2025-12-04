import 'package:flutter/material.dart';
import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/app/utils.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  User? user;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState!.reset();
  }

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;
    setBusy(true);
    try {
      user =
          await apiservice.login(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ) ??
          null;
      if (user != null) {
        await userservice.saveUser(user!);
        navigationService.navigateTo(
          Routes.homeView,
          arguments: HomeViewArguments(user: user),
        );
        return true;
      }
    } catch (e) {
      print("Exepetion:::::$e");
    } finally {
      setBusy(false);
    }
    return false;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
