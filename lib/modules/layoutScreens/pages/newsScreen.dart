import 'package:flutter/material.dart';
import 'package:newsapp/modules/provider/newsProvider.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/newsCard.dart';

class NewsScreenV2 extends StatelessWidget {
  const NewsScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        var sources = newsProvider.sources;
        var articles = newsProvider.articles;

        if (sources.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return Column(
          children: [
            // TabBar for sources
            DefaultTabController(
              length: sources.length,
              child: Container(
                color: AppColors.primaryColor,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Colors.white,
                  onTap: (index) {
                    newsProvider.setSource(sources[index]);
                  },
                  tabs: sources.map((e) => Tab(text: e.name ?? "")).toList(),
                ),
              ),
            ),
            Expanded(
              child: articles.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (_, index) {
                        var article = articles[index];
                        return NewsWidget(article: article);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
