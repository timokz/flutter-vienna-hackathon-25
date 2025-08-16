import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/main.dart';

class ShowLatestNewsWidget extends StatelessWidget {
  const ShowLatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: client.quote.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return Text(snapshot.data ?? "Be the first to submit amazing news!", style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.error));
          return Placeholder();
        });
  }
}
