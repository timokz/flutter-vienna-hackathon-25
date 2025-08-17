import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/widgets/get_location_widget.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/widgets/mapfile_widget.dart';
import 'package:wien_talks_flutter/widgets/news_input_form.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

import '../helper/location_mgr.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
        child: Column(
      children: [
        NewsInputForm(
          onSubmit: (CreateQuoteRequest request) async {
            await FunmapMgr().client.quote.createQuote(request);
          },
        ),
        StreamBuilder(
            stream: LocationMgr().stream,
            builder:
                (BuildContext context, AsyncSnapshot<LocationData> snapshot) =>
                    snapshot.data != null
                        ? Text(snapshot.data.toString())
                        : SizedBox()),
        Expanded(
          child: GetLocationWidget(
            child: MapfileWidget(),
          ),
        ),
      ],
    ));
  }
}
