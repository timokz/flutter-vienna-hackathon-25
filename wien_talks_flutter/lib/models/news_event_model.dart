class NewsEventModel {
  final String content;

  final DateTime timestamp;

  final double latitude;

  final double longitude;

  NewsEventModel({
    required this.content,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });

// Convert NewsData to a Map
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }

// Create NewsData from a Map
  factory NewsEventModel.fromJson(Map<String, dynamic> json) {
    return NewsEventModel(
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}
