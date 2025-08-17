import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wien_talks_client/wien_talks_client.dart';
import 'package:wien_talks_flutter/helper/funmap_mgr.dart';
import 'package:wien_talks_flutter/widgets/carousel_widget.dart';
import 'package:wien_talks_flutter/widgets/get_location_widget.dart';
import 'package:wien_talks_flutter/widgets/mapfile_widget.dart';
import 'package:wien_talks_flutter/widgets/news_input_form.dart';
import 'package:wien_talks_flutter/widgets/screen_widget.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({
    super.key,
    this.contextQuote,
    this.initialLat,
    this.initialLon,
  });

  final Quote? contextQuote;
  final double? initialLat;
  final double? initialLon;

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  double? _lat;
  double? _lon;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _lat = widget.contextQuote?.lat ?? widget.initialLat;
    _lon = widget.contextQuote?.long ?? widget.initialLon;
  }

  Future<void> _useMyLocation() async {
    try {
      final loc = await Location().getLocation();
      if (!mounted) return;
      setState(() {
        _lat = loc.latitude;
        _lon = loc.longitude;
      });
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Couldn`’t get your location.')),
      );
    }
  }

  Future<void> _submit(CreateQuoteRequest req) async {
    final lat = _lat ?? widget.contextQuote?.lat;
    final lon = _lon ?? widget.contextQuote?.long;

    if (lat == null || lon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(' location first.')),
      );
      return;
    }

    final toSend = CreateQuoteRequest(
      text: req.text,
      authorName: req.authorName,
      lat: lat,
      lng: lon,
    );

    setState(() => _submitting = true);
    try {
      await FunmapMgr().client.quote.createQuote(toSend);
      if (!mounted) {
        return;
      }

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Posting failed: $e')),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasContextQuote = widget.contextQuote != null;
    final quote = widget.contextQuote;

    return ScreenWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasContextQuote) ...[
            Card(
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(quote!.text,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 6),
                    Text(
                      [
                        if ((quote.authorName ?? '').trim().isNotEmpty)
                          quote.authorName!.trim()
                      ].join(' · '),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _lat != null && _lon != null
                        ? 'Location: ${_lat!.toStringAsFixed(5)}, ${_lon!.toStringAsFixed(5)}'
                        : 'Pick an alt location',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: _useMyLocation,
                  icon: const Icon(Icons.my_location, size: 18),
                  label: const Text('My location'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: NewsInputForm(
              // enabled: !_submitting,
              onSubmit: _submit,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GetLocationWidget(
                  child: MapfileWidget(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LocationCarousel(
                    suggestions: [
                      if (widget.contextQuote?.lat != null &&
                          widget.contextQuote?.long != null)
                        LocationSuggestion(
                          label: 'Quote location',
                          lat: widget.contextQuote!.lat,
                          lon: widget.contextQuote!.long,
                          assetImage: 'assets/funny_images/tram.jpg',
                        ),
                      const LocationSuggestion(
                          label: 'Stephansplatz',
                          lat: 48.2085,
                          lon: 16.3731,
                          assetImage: 'assets/funny_images/sightseeing.jpg'),
                      const LocationSuggestion(
                          label: 'Naschmarkt',
                          lat: 48.1970,
                          lon: 16.3615,
                          assetImage: 'assets/funny_images/houses.jpg'),
                    ],
                    onPick: (lat, lon) => setState(() {
                      _lat = lat;
                      _lon = lon;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
