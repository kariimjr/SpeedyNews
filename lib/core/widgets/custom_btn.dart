import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/extensions/extension.dart';
import 'package:newsapp/core/theme/app_colors.dart';

class CustomBut extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  bool isLoading;

  CustomBut({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(

        minimumSize: Size(
          MediaQuery.of(context).size.width,
          55, // fixed height
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        backgroundColor: Color(0xffF6BD00),
      ),
      onPressed: onPressed,
      child: Center(
        child: AnimatedCrossFade(
          firstChild: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            text,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          secondChild: CupertinoActivityIndicator(
            color: context.appColorTheme.secondary,
          ),
          crossFadeState: isLoading
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
