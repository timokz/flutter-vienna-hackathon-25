import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:location/location.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/location_mgr.dart';
import 'package:wien_talks_flutter/widgets/error_snackbar.dart';

typedef OnSubmit = Future<void> Function(CreateQuoteRequest request);

class NewsInputForm extends StatefulWidget {
  final OnSubmit onSubmit;

  const NewsInputForm({super.key, required this.onSubmit});

  @override
  _NewsInputFormState createState() => _NewsInputFormState();
}

class _NewsInputFormState extends State<NewsInputForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newsController = TextEditingController();

  @override
  void dispose() {
    _newsController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    LocationData? locationData = LocationMgr().lastLocation;
    if (locationData == null ||
        locationData.latitude == null ||
        locationData.longitude == null) {
      ErrorSnackbar()
          .show(context, "No location available, please retry later");
      return;
    }
    if (_formKey.currentState!.validate()) {
      final newsData = CreateQuoteRequest(
        text: _newsController.text.trim(),
        lat: LocationMgr().lastLocation!.latitude!,
        lng: LocationMgr().lastLocation!.longitude!,
      );
      var handler = context.loaderOverlay..show();
      try {
        await widget.onSubmit(newsData);
      } catch (error) {
        if (context.mounted) {
          ErrorSnackbar().show(context, error.toString());
        }
      } finally {
        handler.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _newsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'News',
                hintText: 'Enter your news here...',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.onPrimary)),
              onPressed: _submitForm,
              child: const Text('Submit News'),
            ),
          ],
        ),
      ),
    );
  }
}
