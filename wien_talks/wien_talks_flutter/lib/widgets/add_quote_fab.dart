import 'package:flutter/material.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';

class AddQuoteFab extends StatelessWidget {
  const AddQuoteFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      FunmapMgr().client.quote.createQuote(
          CreateQuoteRequest(text: 'Quote Text', lat: 22, lng: 140));
    });
  }
}
