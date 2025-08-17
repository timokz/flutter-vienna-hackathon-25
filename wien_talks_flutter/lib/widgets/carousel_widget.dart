import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LocationSuggestion {
  final String label;
  final double lat;
  final double lon;
  final String? subtitle;
  final String? assetImage;
  const LocationSuggestion({
    required this.label,
    required this.lat,
    required this.lon,
    this.subtitle,
    this.assetImage,
  });
}

class LocationCarousel extends StatelessWidget {
  const LocationCarousel({
    super.key,
    required this.suggestions,
    required this.onPick,
    this.height = 96,
  });

  final List<LocationSuggestion> suggestions;
  final void Function(double lat, double lon) onPick;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (suggestions.isEmpty) return const SizedBox.shrink();

    return SafeArea(
      top: false,
      child: Card(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 0.72,
              enlargeCenterPage: true,
              enableInfiniteScroll: suggestions.length > 1,
            ),
            items: suggestions.map((s) {
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onPick(s.lat, s.lon),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (s.assetImage != null)
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(12)),
                          child: Image.asset(
                            s.assetImage!,
                            width: 90,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(s.label,
                                  style: Theme.of(context).textTheme.labelLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              if (s.subtitle != null)
                                Text(s.subtitle!,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              Text(
                                '${s.lat.toStringAsFixed(4)}, ${s.lon.toStringAsFixed(4)}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
