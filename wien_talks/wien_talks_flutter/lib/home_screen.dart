import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/show_latest_news_widget.dart';
import 'package:wien_talks_flutter/widgets/intro_text_widget.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

import 'carousel_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroTextWidget(),
            ShowLatestNewsWidget(),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed("create_event");
                      },
                      child: Text("Submit your own event")),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CarouselWidget(),
          ],
        ),
      ),
    );
  }
}
