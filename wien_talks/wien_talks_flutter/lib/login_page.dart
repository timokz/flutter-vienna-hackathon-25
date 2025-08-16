import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wien_talks_flutter/helper/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Wien Talks',
                style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 60),
            FilledButton.icon(
              onPressed: () async => await AuthService.signIn(),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 6,
              ),
              icon: Icon(
                Icons.lock,
              ),
              label: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
