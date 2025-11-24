import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_btn.dart';
import '../manager/authProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 67, horizontal: 19),
        child: ChangeNotifierProvider(
          create: (context) => AuthProvider(),
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Form(
                key: authProvider.formKey,
                child: Column(
                  spacing: 17,
                  children: [
                    Image.asset(
                      "assets/logo/SpeedyNewsY.png",
                      height: 200,
                      width: 207,
                      fit: BoxFit.contain,
                    ),
                    Spacer(),
                    Column(
                      spacing: 22,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required"; // ← This shows as error
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
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
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          obscureText: showPassword,
                          controller: authProvider.passwordController,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                "assets/icons/password.svg",
                                width: 30,
                                height: 30,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showPassword = !showPassword;
                                setState(() {});
                              },
                              icon: showPassword
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    )
                                  : Icon(Icons.visibility, color: Colors.white),
                            ),
                            hintText: "Password",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteName.Forget);
                          },
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: AppColors.mainColor,fontSize: 16)
                          ),
                        ),
                      ],
                    ),

                    CustomBut(
                      onPressed: () {
                        authProvider.Login(context);
                      },
                      text: "Login",
                      isLoading: authProvider.isLoading,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t Have Account ?",
                          style:TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.CreateAccount,
                            );
                          },
                          child: Text(
                            "Create One",
                            style:TextStyle(color:AppColors.mainColor,fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Divider(
                            thickness: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          "       OR     ",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 100,
                          child: Divider(
                            thickness: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    CustomBut(
                      onPressed: () {
                        authProvider.Login(context);
                      },
                      text: "Login With Google",
                      isLoading: false,
                    ),
                    Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
