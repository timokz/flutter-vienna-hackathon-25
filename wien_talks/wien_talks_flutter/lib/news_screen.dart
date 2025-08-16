import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/show_latest_news_widget.dart';
import 'package:wien_talks_flutter/widgets/heading_text.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingText(text: "Latest news"),
            ShowLatestNewsWidget(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context.pushNamed("create_event");
                },
                child: Text("Submit your own event")),
          ],
        ),
      ),
    );
  }
}
