import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:wien_talks_client/wien_talks_client.dart';

class FunmapMgr {
  static FunmapMgr? _instance;

  FunmapMgr._() {
    configure();
  }

  late Client client;

  late final String serverUrl;

  factory FunmapMgr() {
    if (_instance != null) return _instance!;
    _instance = FunmapMgr._();
    return _instance!;
  }

  void configure() {
    // When you are running the app on a physical device, you need to set the
    // server URL to the IP address of your computer. You can find the IP
    // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
    // You can set the variable when running or building your app like this:
    // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`

    const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
    serverUrl =
        serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : serverUrlFromEnv;

    client = Client(serverUrl, connectionTimeout: const Duration(seconds: 2))
      ..connectivityMonitor = FlutterConnectivityMonitor();

    client.openStreamingConnection();
  }
}
