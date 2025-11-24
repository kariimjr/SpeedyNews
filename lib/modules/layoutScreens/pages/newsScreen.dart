import 'package:flutter/material.dart';
import 'package:newsapp/core/constant/catageories/catageories.dart';

import '../../../core/api/apiManager.dart';
import '../../../core/api/models/news_response.dart';
import '../widgets/newsCard.dart';

class NewsScreen extends StatefulWidget {
   Catageories? catageory;
   NewsScreen({super.key,required this.catageory});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Source? selectedSource;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.catageory!.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var sources = snapshot.data ?? [];
          selectedSource ??= sources.first;
          return Column(
            children: [
              DefaultTabController(
                length: sources.length,
                child: TabBar(
                  onTap: (value) {
                    selectedSource = sources[value];
                    setState(() {});
                  },
                  isScrollable: true,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  tabs: sources.map(
                        (e) {
                      return Tab(
                        text: e.name ?? "",
                      );
                    },
                  ).toList(),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiManager.getNews(selectedSource!.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      var articles = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          var article = articles[index];
                          return NewsWidget(article: article);
                        },
                      );
                    } else {
                      return Text(snapshot.error.toString());
                    }
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
