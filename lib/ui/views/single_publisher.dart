import 'package:flutter/material.dart';
import 'package:my_news_app/core/models/news_agency.dart';

class SinglePublisherView extends StatelessWidget {
  final NewsAgency? publisher;

  const SinglePublisherView({
    super.key,
    this.publisher,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          publisher?.sourceTitle ?? "No Publisher Found",
        ),
      ),
    );
  }
}
