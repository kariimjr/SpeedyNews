import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/theme/app_colors.dart';

import 'package:provider/provider.dart';

import '../../../core/widgets/custom_btn.dart';
import '../manager/authProvider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          "Forget Password",
        ),
      ),
  body: Column(
    children: [
      Image.asset("assets/images/Forgot password.png"),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Form(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 24,
                children: [
                  TextFormField(
                    controller: authProvider.emailController,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          "assets/icons/email.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      hintText: "Email",
                    ),
                  ),
                  CustomBut(
                    onPressed: () {
                      authProvider.ForgetPassword(context);
                    },
                    text: "Verify Email",
                    isLoading: authProvider.isLoading,
                  ),


                ],

              ),
            ));
          },
        ),
      )
    ],
  ),

    );
  }
}
