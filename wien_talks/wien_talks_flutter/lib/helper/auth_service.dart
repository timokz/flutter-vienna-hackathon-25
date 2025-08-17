import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final _google = GoogleSignIn.instance;

  static AuthService? _instance;

  AuthService._() {
    _google.initialize();
  }
  factory AuthService() {
    if (_instance != null) return _instance!;
    _instance = AuthService._();

    return _instance!;
  }

  static Stream<GoogleSignInAuthenticationEvent?> get onUserChanged =>
      _google.authenticationEvents;

  static Future<GoogleSignInAccount?> signIn() async {
    try {
      return await _google.authenticate();
    } catch (_) {
      return null;
    }
  }

  static Future<void> signOut() => _google.disconnect();
}
