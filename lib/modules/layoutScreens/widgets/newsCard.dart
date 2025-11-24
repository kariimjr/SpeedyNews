import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/extensions/extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/api/models/news_response.dart';
import '../../../core/theme/app_colors.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.article});

  final Articles article;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 500,
                child: Column(
                  spacing: 12,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.network(
                        widget.article.urlToImage ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      widget.article.content ?? "",
                      style: context.appTextTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.tryParse(widget.article.url ?? '');
                        if (url != null) {
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        }
                      },
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size(380, 56),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.primaryColor,
                        ),
                      ),
                      child: Text(
                        "View Full Article",
                        style: context.appTextTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.secondaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: widget.article.urlToImage ?? "",
                  placeholder: (context, url) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) {
                    return SizedBox(
                      height: 190,
                      child: Icon(Icons.error, color: AppColors.secondaryColor),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              textAlign: TextAlign.left,
              widget.article.title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,

                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By:" + (widget.article.author ?? ""),
                    style: TextStyle(
                      color: AppColors.thirdColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  (widget.article.publishedAt ?? "").substring(0, 10),
                  style: TextStyle(
                    color: AppColors.thirdColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
