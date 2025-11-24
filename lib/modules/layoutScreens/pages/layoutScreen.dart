import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/routes/app_routes_name.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/catageories/catageories.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_btn.dart';
import '../../provider/newsProvider.dart';
import 'newsScreen.dart';
import '../widgets/catagorisCard.dart';

class LayoutScreenV2 extends StatefulWidget {
  LayoutScreenV2({super.key});

  @override
  State<LayoutScreenV2> createState() => _LayoutScreenV2State();
}

class _LayoutScreenV2State extends State<LayoutScreenV2> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, _) {
        var selectedCategory = newsProvider.selectedCategory;
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          drawer: Drawer(
            backgroundColor: AppColors.primaryColor,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Expanded(
                              child: Text(
                                FirebaseAuth.instance.currentUser?.displayName ??
                                    "User",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            FirebaseAuth.instance.currentUser!.emailVerified
                                ? Icon(Icons.verified_rounded,color: Colors.blue,)
                                : Icon(Icons.verified_outlined),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.email_rounded,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Expanded(
                              child: Text(
                                FirebaseAuth.instance.currentUser?.email ??
                                    "User",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    newsProvider.resetCategory(); // Reset provider
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.mainColor,
                  ),
                  title: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.home_rounded, color: AppColors.mainColor),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CupertinoButton(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, RouteName.Login);
                  },
                ),
                CupertinoButton(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Center(
                      child: Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.currentUser?.delete();
                    Navigator.pushReplacementNamed(context, RouteName.Login);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  isSearching = true;
                },
                icon: Icon(Icons.search_rounded),
              ),
            ],
            title: Image.asset(
              "assets/logo/SpeedyNewsLogoTextY.png",
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
          ),
          body: selectedCategory == null
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Good Morning, ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "${user!.displayName} !".toUpperCase(),
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Here is some news for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemCount: Catageories.CatageoriesInfo.length,
                          itemBuilder: (_, index) {
                            var category = Catageories.CatageoriesInfo[index];
                            return catagoriesCard(
                              category: category,
                              onNavigate: (_) {
                                newsProvider.setCategory(category);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const NewsScreenV2(),
        );
      },
    );
  }
}
