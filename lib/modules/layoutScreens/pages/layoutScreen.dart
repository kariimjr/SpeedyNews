import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/catageories/catageories.dart';
import '../../../core/theme/app_colors.dart';
import '../../provider/newsProvider.dart';
import 'newsScreen.dart';
import '../widgets/catagorisCard.dart';



class LayoutScreenV2 extends StatelessWidget {
  const LayoutScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, _) {
        var selectedCategory = newsProvider.selectedCategory;

        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          drawer: Drawer(
            backgroundColor: Colors.black,
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Text(
                      "News",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    newsProvider.resetCategory(); // Reset provider
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Go to Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            title: Text(
              selectedCategory?.name ?? "Home",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: selectedCategory == null
              ? Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning, Karim!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Here is some news for you",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) =>
                    const SizedBox(height: 16),
                    itemCount: Catageories.CatageoriesInfo.length,
                    itemBuilder: (_, index) {
                      var category =
                      Catageories.CatageoriesInfo[index];
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
