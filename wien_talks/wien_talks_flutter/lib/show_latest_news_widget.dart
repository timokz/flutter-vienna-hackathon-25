import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/widgets/heading_text.dart';

import 'helper/funmap_mgr.dart';

class ShowLatestNewsWidget extends StatelessWidget {
  const ShowLatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FunmapMgr().client.quote.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: "Latest news"),
              if (snapshot.hasError) Text('Error: ${snapshot.error}'),
              Text(snapshot.data ?? "Be the first to submit amazing news!", style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error)),
            ],
          );
        });
  }
}
