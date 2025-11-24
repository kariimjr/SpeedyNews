import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_btn.dart';
import '../manager/authProvider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          Image.asset("assets/images/newaccount.png",height: 350,width: 350,fit: BoxFit.cover,),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10),
            child: ChangeNotifierProvider(
              create: (context) => AuthProvider(),
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: authProvider.formKey,
                          child: Column(
                            spacing: 15,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  return null;
                                },
                                controller: authProvider.nameController,
                                onTapOutside: (event) => FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.white,
                                  ),
                                  hintText: "Name",
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email is required"; // ← This shows as error
                                  }
                                  if (!RegExp(
                                    r'\S+@\S+\.\S+',
                                  ).hasMatch(value)) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                                controller: authProvider.emailController,

                                onTapOutside: (event) => FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
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

                                onTapOutside: (event) => FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    color: Colors.white,
                                  ),
                                  hintText: "Password",
                                ),
                              ),
                              TextFormField(
                                obscureText: showPassword,

                                controller: authProvider.rePasswordController,
                                validator: (value) {
                                  if (authProvider.rePasswordController.text !=
                                      authProvider.passwordController.text) {
                                    return "Password is not matching";
                                  } else {
                                    return null;
                                  }
                                },
                                onTapOutside: (event) => FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    color: Colors.white,
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
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          ),
                                  ),
                                  hintText: "Password",
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your Phone";
                                  }
                                  return null;
                                },
                                controller: authProvider.phoneController,

                                onTapOutside: (event) => FocusManager
                                    .instance
                                    .primaryFocus
                                    ?.unfocus(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_outlined,
                                    color: Colors.white,
                                  ),
                                  hintText: "Phone Number",
                                ),
                              ),
                              CustomBut(
                                onPressed: () {
                                  authProvider.CreateAcc(context);
                                },
                                text: "Create Account",
                                isLoading: authProvider.isLoading,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have Account ?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.Login);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
