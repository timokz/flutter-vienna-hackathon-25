import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/screens/latest_quotes_screen.dart';
import 'package:wien_talks_flutter/widgets/intro_text_widget.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

import '../widgets/carousel_widget.dart';

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
            SizedBox(height: 200, child: LatestQuotesScreen()),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor),
                          foregroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.onPrimary)),
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
            Row(
              children: [
                Spacer(),
                Text(FunmapMgr().serverUrl,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ],
        ),
      ),
    );
  }
}
