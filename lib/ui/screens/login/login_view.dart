import 'package:flutter/material.dart';
import 'package:my_mvvm/ui/screens/login/login_view_model.dart';
import 'package:my_mvvm/ui/tools/blur_background.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () {
        return LoginViewModel();
      },
      builder: (BuildContext context, LoginViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              loginform(context, viewModel),
              if (viewModel.isBusy)
                Positioned.fill(
                  child: BlurBackground(
                    child: Container(
                      color: Color(0xff00000033),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    blur: 4,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget loginform(BuildContext context, LoginViewModel viewModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),

                TextFormField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return viewModel.validateEmail(value);
                  },
                ),
                TextFormField(
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return viewModel.validatePassword(value);
                  },
                ),

                SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool status = await viewModel.login();
                      if (status) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Successful!')),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
