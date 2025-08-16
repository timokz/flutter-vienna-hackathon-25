import 'package:flutter/cupertino.dart';
import 'package:wien_talks_flutter/get_location_widget.dart';
import 'package:wien_talks_flutter/news_input_form.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
        child: Column(
      children: [
        Text("hello"),
        GetLocationWidget(),
        NewsInputForm(onSubmit: (newsEventModel) {}),
      ],
    ));
  }
}
