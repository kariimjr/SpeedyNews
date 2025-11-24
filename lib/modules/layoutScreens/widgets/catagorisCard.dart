import 'package:flutter/material.dart';
import 'package:newsapp/core/extensions/extension.dart';

import '../../../core/constant/catageories/catageories.dart';
import '../../../core/theme/app_colors.dart';

class catagoriesCard extends StatefulWidget {
  final Catageories category;

  final Function(Catageories value) onNavigate;

  catagoriesCard({super.key, required this.onNavigate, required this.category});

  @override
  State<catagoriesCard> createState() => _catagoriesCardState();
}

class _catagoriesCardState extends State<catagoriesCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(widget.category.images),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.category.name,
                        style: context.appTextTheme.titleLarge?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(Size(100, 70)),
                          iconSize: WidgetStatePropertyAll(25),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                           AppColors.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          widget.onNavigate(widget.category);
                          setState(() {

                          });
                        },
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.mainColor,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
