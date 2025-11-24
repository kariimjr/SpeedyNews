import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/catageories/catageories.dart';
import 'package:newsapp/core/extensions/extension.dart';


import '../../../core/theme/app_colors.dart';
import '../widgets/catagorisCard.dart';
import 'newsScreen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  Catageories? selectedCatageory;

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                selectedCatageory = null;
                setState(() {});
              },
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
              title: const Text(
                "Go to Home",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          selectedCatageory?.name == null
              ? "Home"
              : selectedCatageory?.name as String,
          style: context.appTextTheme.bodyMedium,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: context.appColorTheme.onPrimary),
      ),
      body: selectedCatageory == null
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning, Karim !",
                        style: context.appTextTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Here is Some News For You",
                        style: context.appTextTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      shrinkWrap: true,
                      itemCount: 7,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var category = Catageories.CatageoriesInfo[index];
                        return catagoriesCard(
                          category: category,
                          onNavigate: (value) {
                            selectedCatageory = value;
                            print(selectedCatageory);
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : NewsScreen(catageory: selectedCatageory,),
    );
  }
}
