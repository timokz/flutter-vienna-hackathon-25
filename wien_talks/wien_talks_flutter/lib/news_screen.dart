import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wien_talks_flutter/main.dart';
import 'package:wien_talks_flutter/widgets/heading_text.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingText(text: "Latest news"),
        ...[Text("News 1"), Text("News 2")],
        SizedBox(
          height: 30,
        ),
        OutlinedButton(
            onPressed: () {
              context.pushNamed("create_event");
            },
            child: Text("Submit your own event")),
      ],
    );
    return ScreenWidget(
      child: SingleChildScrollView(
          child: StreamBuilder(
              stream: client.quote.quoteUpdates(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Text(snapshot.data?.text ?? 'Empty Text');
                }

                return Text('Empty or Error');
              })),
    );
  }
}
