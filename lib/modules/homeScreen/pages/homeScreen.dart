import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/catageories/catageories.dart';
import 'package:newsapp/core/extensions/extension.dart';
import 'package:newsapp/core/theme/app_colors.dart';
import 'package:newsapp/modules/homeScreen/widgets/catagorisCard.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text("Home", style: context.appTextTheme.bodyMedium),
        centerTitle: true,
        backgroundColor: context.appColorTheme.secondary,
        iconTheme: IconThemeData(color: context.appColorTheme.onPrimary),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 15),
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
                separatorBuilder: (context, index) => SizedBox(height: 16,),
                shrinkWrap: true  ,
                itemCount: 7,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  bool onRight=false;
                  if(index%2!=0 && index!=0){
                    onRight=true;
                  }
                  return catagoriesCard(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
