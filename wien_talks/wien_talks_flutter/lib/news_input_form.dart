import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/models/news_event_model.dart';

class NewsInputForm extends StatefulWidget {
  final Function(NewsEventModel) onSubmit;

  const NewsInputForm({Key? key, required this.onSubmit}) : super(key: key);

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newsData = NewsEventModel(
        content: _newsController.text.trim(),
        timestamp: DateTime.now(),
        latitude: 0.0,
        longitude: 0.0,
      );
      widget.onSubmit(newsData);
      _newsController.clear();
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
              onPressed: _submitForm,
              child: const Text('Submit News'),
            ),
          ],
        ),
      ),
    );
  }
}
