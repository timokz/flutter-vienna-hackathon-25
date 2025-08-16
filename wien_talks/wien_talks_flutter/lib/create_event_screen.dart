import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:wien_talks_flutter/get_location_widget.dart';
import 'package:wien_talks_flutter/mapfile_widget.dart';
import 'package:wien_talks_flutter/news_input_form.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

import 'location_mgr.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
        child: Column(
      children: [
        NewsInputForm(onSubmit: (newsEventModel) {}),
        StreamBuilder(stream: LocationMgr().stream, builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) => Text(snapshot.data.toString())),
        Expanded(
          child: GetLocationWidget(
            child: MapfileWidget(),
          ),
        ),
      ],
    ));
  }
}
