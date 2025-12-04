import 'package:flutter/material.dart';
import 'package:my_mvvm/models/User.dart';
import 'package:my_mvvm/ui/screens/homescreen/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  User? user;
  HomeView({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () {
        return HomeViewModel(user!);
      },
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text("hai ${viewModel.user.name}")),
        );
      },
    );
  }
}
