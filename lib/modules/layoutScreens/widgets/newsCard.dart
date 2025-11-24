import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/api/models/news_response.dart';
import '../../../core/theme/app_colors.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, error, stackTrace) {
                    return const SizedBox(
                        height: 190,
                        child: Icon(
                          Icons.error,
                          color: Colors.white,
                        ));
                  },
                )),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.left,
            article.title ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,

                color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By:" + (article.author ?? ""),
                  style:
                  const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16),
                ),
              ),
              Text(
                (article.publishedAt ?? "")
                    .substring(0, 10),
                style:
                const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}