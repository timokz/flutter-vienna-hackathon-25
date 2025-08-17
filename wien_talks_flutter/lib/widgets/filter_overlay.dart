import 'package:flutter/material.dart';
import 'package:wien_talks_flutter/helper/location_filter.dart';

class LocationFilterSheet extends StatefulWidget {
  const LocationFilterSheet({super.key, this.current});
  final LocationFilter? current;

  @override
  State<LocationFilterSheet> createState() => _LocationFilterSheetState();
}

class _LocationFilterSheetState extends State<LocationFilterSheet> {
  final _latCtrl = TextEditingController();
  final _lonCtrl = TextEditingController();

  double? _lat;
  double? _lon;
  double _radius = 1000;

  @override
  void initState() {
    super.initState();
    final c = widget.current;
    _lat = c?.centerLat;
    _lon = c?.centerLon;
    _radius = c?.radiusMeters ?? _radius;
    _latCtrl.text = _lat?.toStringAsFixed(6) ?? '';
    _lonCtrl.text = _lon?.toStringAsFixed(6) ?? '';
    _latCtrl.addListener(() => _lat = double.tryParse(_latCtrl.text));
    _lonCtrl.addListener(() => _lon = double.tryParse(_lonCtrl.text));
  }

  @override
  void dispose() {
    _latCtrl.dispose();
    _lonCtrl.dispose();
    super.dispose();
  }

  bool get _coordsValid {
    final lat = _lat, lon = _lon;
    return lat != null &&
        lon != null &&
        lat >= -90 &&
        lat <= 90 &&
        lon >= -180 &&
        lon <= 180;
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Location filter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),

            //todo(timo) fix decimal point display
            TextField(
              controller: _latCtrl,
              decoration: InputDecoration(
                labelText: 'Center latitude',
                errorText: (_lat == null || (_lat! >= -90 && _lat! <= 90))
                    ? null
                    : ' between −90 and 90',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _lonCtrl,
              decoration: InputDecoration(
                labelText: 'Center longitude',
                errorText: (_lon == null || (_lon! >= -180 && _lon! <= 180))
                    ? null
                    : '  between −180 and 180',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Radius'),
                Expanded(
                  child: Slider(
                    value: _radius,
                    min: 200,
                    max: 5000,
                    divisions: 24,
                    label:
                        '${(_radius / 1000).toStringAsFixed(_radius < 1000 ? 1 : 0)} km',
                    onChanged: (v) => setState(() => _radius = v),
                  ),
                ),
                SizedBox(
                  width: 72,
                  child: Text('${(_radius / 1000).toStringAsFixed(1)} km'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        Navigator.pop<LocationFilter?>(context, null),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _coordsValid
                        ? () => Navigator.pop<LocationFilter>(
                              context,
                              LocationFilter(
                                centerLat: _lat!,
                                centerLon: _lon!,
                                radiusMeters: _radius,
                              ),
                            )
                        : null,
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
